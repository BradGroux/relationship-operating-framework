#!/usr/bin/env ruby
# frozen_string_literal: true

require "pathname"
require "uri"

ROOT = Pathname.new(__dir__).join("..").realpath

def headings(path)
  counts = Hash.new(0)
  fenced = false
  path.readlines.each_with_object([]) do |line, anchors|
    if line.start_with?("```")
      fenced = !fenced
      next
    end
    next if fenced
    next unless line.match?(/^[#]{1,6} /)

    anchor = line.sub(/^[#]{1,6} /, "")
                   .strip
                   .downcase
                   .gsub(/[^\p{Alnum}\s-]/, "")
                   .tr(" ", "-")
                   .gsub(/-+/, "-")
    count = counts[anchor]
    counts[anchor] += 1
    anchors << (count.zero? ? anchor : "#{anchor}-#{count}")
  end
end

errors = []
markdown_files = IO.popen(
  ["git", "-C", ROOT.to_s, "ls-files", "--cached", "-z", "*.md"],
  &:read
).split("\0")

public_files = IO.popen(["git", "-C", ROOT.to_s, "ls-files", "-z"], &:read).split("\0")

markdown_files.each do |relative|
  source = ROOT.join(relative)
  text = source.read.gsub(/^```.*?^```[^\n]*$/m, "")
  references = text.scan(/^ {0,3}\[([^\]]+)\]:\s*<?([^\s>]+)>?/).to_h.transform_keys(&:downcase)
  targets = text.scan(/!?\[[^\]]*\]\(([^)]+)\)/).flatten
  targets.concat(references.values)
  text.scan(/\[([^\]]+)\]\[([^\]]*)\]/).each do |label, ref|
    key = (ref.empty? ? label : ref).downcase
    errors << "#{relative}: undefined reference link" unless references.key?(key)
  end
  targets.each do |raw_target|
    target = raw_target.strip.delete_prefix("<").delete_suffix(">")
    next if target.empty? || target.start_with?("http://", "https://", "mailto:")

    path_part, anchor = target.split("#", 2)
    decoded = URI::DEFAULT_PARSER.unescape(path_part || "")
    destination = decoded.empty? ? source : source.dirname.join(decoded).cleanpath

    unless destination.file? && !destination.symlink? && destination.realpath.to_s.start_with?(ROOT.to_s + "/") && public_files.include?(destination.relative_path_from(ROOT).to_s)
      errors << "#{relative}: missing local link target #{target}"
      next
    end

    next if anchor.nil? || anchor.empty? || !destination.file? || destination.extname.downcase != ".md"

    errors << "#{relative}: missing anchor ##{anchor} in #{decoded}" unless headings(destination).include?(URI::DEFAULT_PARSER.unescape(anchor))
  end

  open_mermaid_fence = false
  source.each_line do |line|
    if open_mermaid_fence
      open_mermaid_fence = false if line.strip == "```"
    elsif line.start_with?("```mermaid")
      open_mermaid_fence = true
    end
  end
  errors << "#{relative}: Mermaid fence is not closed" if open_mermaid_fence
end

abort(errors.join("\n")) unless errors.empty?

puts "Markdown links and Mermaid fences passed for #{markdown_files.length} files."
