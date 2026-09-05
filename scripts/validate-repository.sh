#!/usr/bin/env bash
set -euo pipefail

repository_root="$(git rev-parse --show-toplevel)"
cd "$repository_root"

required_files=(
  README.md VERSION CHANGELOG.md CITATION.cff GOVERNANCE.md CONTRIBUTING.md
  CODE_OF_CONDUCT.md SECURITY.md LICENSE framework/README.md
  framework/charter.md framework/principles-and-boundaries.md
  framework/practice-guide.md framework/glossary.md decisions/README.md
  decisions/template.md decisions/0001-adopt-open-framework-commons-v1.1.0.md
  project/releases/README.md project/releases/v1.1.0.md project/reviews/README.md
  project/reviews/v1.1.0-practical-application-review-2026-08-22.md
  project/reviews/v1.1.0-adversarial-misuse-review-2026-08-22.md
  project/reviews/v1.1.0-canonical-coherence-review-2026-08-22.md
  project/reviews/v1.1.0-public-hygiene-review-2026-08-22.md
  project/reviews/v1.1.0-review-disposition-2026-08-22.md
  .github/CODEOWNERS .github/ISSUE_TEMPLATE/framework-change.yml
  .github/ISSUE_TEMPLATE/config.yml .github/PULL_REQUEST_TEMPLATE.md
  .github/workflows/validate.yml
)

for required_file in "${required_files[@]}"; do
  test -f "$required_file" || { echo "Missing required file: $required_file" >&2; exit 1; }
done

for executable_file in scripts/validate-markdown.rb scripts/validate-mermaid.sh scripts/validate-release.sh scripts/validate-repository.sh; do
  test -x "$executable_file" || {
    echo "Required validation file is not executable: $executable_file" >&2
    exit 1
  }
done

version="$(tr -d '\r\n' < VERSION)"
ruby -r date -r yaml -e '
  version = File.read("VERSION").strip
  match = /\A(\d{4})\.(\d{2})\.(\d{2})(?:\.([1-9]\d*))?\z/.match(version)
  abort("Invalid calendar edition") unless match
  date = Date.new(*match.captures.first(3).map(&:to_i)).iso8601
  data = YAML.safe_load(File.read("CITATION.cff"), permitted_classes: [Date], aliases: false)
  abort("Citation version/date mismatch") unless data["version"] == version && data["date-released"].to_s == date
  checks = {
    "README.md" => "Version #{version} is the first calendar edition.",
    "framework/charter.md" => "**Status:** Accepted #{version}",
    "CHANGELOG.md" => "## #{version} — #{date}",
    "project/releases/v#{version}.md" => "**Release date:** #{date}"
  }
  # Later editions need not describe themselves as the first.
  checks["README.md"] = "Version #{version} "
  checks.each { |path, literal| abort("Missing edition metadata: #{path}") unless File.read(path).include?(literal) }
  abort("Charter date mismatch") unless File.read("framework/charter.md").include?("**Current revision:** #{date}")
'

commons_version="v2026.09.05"
commons_commit="8868a248457dd7b663563beb243c5ebcbb8ac360"
for adoption_file in AGENTS.md README.md CONTRIBUTING.md GOVERNANCE.md framework/charter.md framework/principles-and-boundaries.md framework/glossary.md decisions/0002-calendar-editions-and-commons-adoption.md; do
  grep -Fq "$commons_version" "$adoption_file" || { echo "Missing current Commons adoption: $adoption_file" >&2; exit 1; }
done
for authority_file in AGENTS.md README.md framework/charter.md decisions/0002-calendar-editions-and-commons-adoption.md; do
  grep -Fq "$commons_commit" "$authority_file" || { echo "Missing exact Commons commit: $authority_file" >&2; exit 1; }
done

ruby scripts/validate-markdown.rb

if rg --hidden -l -i '/Users/|gho_[[:alnum:]_]+|sk-[[:alnum:]_-]+|codex|chatgpt|claude|anthropic|openai' \
  --glob '!.git/**' --glob '!scripts/validate-repository.sh' .; then
  echo "Publication-hygiene pattern found in public content." >&2
  exit 1
fi

empty_tree="$(git hash-object -t tree /dev/null)"
git diff --check "$empty_tree" HEAD
git diff --check HEAD

echo "Repository validation passed for version $version."
