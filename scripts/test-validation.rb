#!/usr/bin/env ruby
# frozen_string_literal: true
require 'minitest/autorun'
require 'tmpdir'
require 'fileutils'
require 'open3'

class ValidationTest < Minitest::Test
  def setup
    @root = Dir.mktmpdir('relationship-validation-')
    source = File.expand_path('..', __dir__)
    files = IO.popen(['git', '-C', source, 'ls-files', '-z'], &:read).split("\0")
    files.each do |file|
      target = File.join(@root, file)
      FileUtils.mkdir_p(File.dirname(target))
      FileUtils.cp(File.join(source, file), target)
    end
    system('git', 'init', '-q', @root, out: File::NULL, err: File::NULL) or raise
    git('add', '.')
    git('-c', 'user.name=Fixture', '-c', 'user.email=fixture@example.invalid', 'commit', '-qm', 'Fixture')
  end
  def teardown
    FileUtils.remove_entry(@root)
  end
  def git(*args)
    system('git', '-C', @root, *args, out: File::NULL, err: File::NULL) or raise
  end
  def write(path, text)
    File.write(File.join(@root, path), text)
  end
  def append(path, text)
    File.open(File.join(@root, path), 'a') { |f| f.puts(text) }
  end
  def passes(script = 'scripts/validate-markdown.rb')
    _, status = Open3.capture2e(script.end_with?('.rb') ? 'ruby' : 'bash', script, chdir: @root)
    status.success?
  end
  def test_current_tree
    assert passes('scripts/validate-repository.sh')
  end
  def test_same_file_missing_fragment
    append('README.md', '[broken](#no-such-heading)')
    refute passes
  end
  def test_duplicate_heading_and_reference
    append('README.md', "\n## Repeated\n\n## Repeated\n\n[second](#repeated-1)\n\n[guide][ref]\n\n[ref]: framework/practice-guide.md\n")
    assert passes
  end
  def test_untracked_target
    write('unpublished.md', '# Unpublished')
    append('README.md', '[missing](unpublished.md)')
    refute passes
  end
  def test_outside_tree
    append('README.md', '[outside](../README.md)')
    refute passes
  end
  def test_symlink_target
    File.symlink('README.md', File.join(@root, 'alias.md'))
    git('add', 'alias.md')
    append('README.md', '[alias](alias.md)')
    refute passes
  end
  def test_invalid_calendar_date
    write('VERSION', "2026.02.30\n")
    refute passes('scripts/validate-repository.sh')
  end
  def test_zero_correction
    write('VERSION', "2026.09.05.0\n")
    refute passes('scripts/validate-repository.sh')
  end
  def test_stale_citation
    p = File.join(@root, 'CITATION.cff')
    write('CITATION.cff', File.read(p).sub('2026-09-05', '2026-09-04'))
    refute passes('scripts/validate-repository.sh')
  end
  def test_stale_release_note
    p = File.join(@root, 'project/releases/v2026.09.05.md')
    write('project/releases/v2026.09.05.md', File.read(p).sub('**Release date:** 2026-09-05', '**Release date:** 2026-09-04'))
    refute passes('scripts/validate-repository.sh')
  end
end
