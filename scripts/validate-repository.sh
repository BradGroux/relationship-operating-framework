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
[[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || {
  echo "VERSION is not semantic: $version" >&2
  exit 1
}

grep -Fq "Version $version" README.md
grep -Eq "Prepared $version candidate|Accepted $version" framework/charter.md
grep -Fq "## $version" CHANGELOG.md
grep -Fq "version: $version" CITATION.cff

if grep -Fq "Accepted $version" framework/charter.md; then
  grep -Fq "date-released:" CITATION.cff
  grep -Fq "Release date:" project/releases/v1.1.0.md
else
  ! grep -Fq "date-released:" CITATION.cff
  grep -Fq "Planned release date:" project/releases/v1.1.0.md
fi

commons_version="v1.1.0"
commons_commit="f25a2b89b4aed95984fd235e2e229efe52c125d8"
current_adoption_files=(
  AGENTS.md README.md CONTRIBUTING.md GOVERNANCE.md framework/charter.md
  framework/principles-and-boundaries.md framework/glossary.md
  decisions/0001-adopt-open-framework-commons-v1.1.0.md
)

for adoption_file in "${current_adoption_files[@]}"; do
  grep -Fq "$commons_version" "$adoption_file" || {
    echo "Missing Commons $commons_version adoption reference: $adoption_file" >&2
    exit 1
  }
done

for authority_file in AGENTS.md README.md framework/charter.md decisions/0001-adopt-open-framework-commons-v1.1.0.md; do
  grep -Fq "$commons_commit" "$authority_file" || {
    echo "Missing exact Commons commit: $authority_file" >&2
    exit 1
  }
done

ruby -r date -r yaml -e '
  data = YAML.safe_load(File.read("CITATION.cff"), permitted_classes: [Date], aliases: false)
  abort("CITATION.cff version mismatch") unless data["version"].to_s == File.read("VERSION").strip
'

ruby scripts/validate-markdown.rb

if rg --hidden -n -i '/Users/|gho_[[:alnum:]_]+|sk-[[:alnum:]_-]+|codex|chatgpt|claude|anthropic|openai' \
  --glob '!.git/**' --glob '!scripts/validate-repository.sh' .; then
  echo "Publication-hygiene pattern found in public content." >&2
  exit 1
fi

empty_tree="$(git hash-object -t tree /dev/null)"
git diff --check "$empty_tree" HEAD
git diff --check HEAD

echo "Repository validation passed for version $version."
