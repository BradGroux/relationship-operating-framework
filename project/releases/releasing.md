# Release operations

This runbook is repository maintenance, not a relationship practice requirement.
Use Git, Bash, Ruby with its standard YAML/Date libraries, Python 3, ripgrep,
GitHub CLI, and a maintained browser/Node environment for the existing pinned
Mermaid CLI. Gitleaks supplies a separate redacted secret gate. There are no
production dependencies or package/schema consumers. Mermaid compilation uses
an exact CLI version but downloads transitive development dependencies; it is
not a locked or offline-reproducible toolchain. Review its dependency advisories
before releases. CI only runs the dependency-free repository gate.

## Prepare and review

1. Start from a clean, current main or isolate unrelated work. Inspect status,
   branch, remote and authorship. Confirm GitHub identity is BradGroux.
2. Resolve content issues before metadata. Record affected reader decisions,
   alternatives, evidence limits, independent Commons adoption and compatibility.
3. Select the actual UTC publication date using `date -u +%Y.%m.%d`. Use
   YYYY.MM.DD, then .1, .2 for additional publications that UTC day. If the date
   changes before publication, update metadata and rerun affected reviews.
4. Update VERSION, README, charter, governance revision, citation date and quoted
   version, changelog and `project/releases/v<VERSION>.md`. Preserve historical
   records. Do not force a calendar string into unrelated package metadata.
5. Stage intended new public files before link validation. Run:

```sh
./scripts/validate-repository.sh
ruby scripts/test-validation.rb
./scripts/validate-mermaid.sh
gitleaks git . --redact --no-banner --log-level error
git diff --check
```

The small Markdown checker supports the repository's inline/reference links,
fragments and duplicate headings. Avoid raw HTML navigation and complicated
inline markup in linked headings; manual review covers unsupported syntax.
Inspect every tracked public file for private context and unsupported claims.
Scan a temporary `git archive` of the candidate with `gitleaks dir` as well.
Check external destinations relevant to changed guidance. Compile diagrams and
visually inspect any changed meaning or layout with its adjacent prose.

6. Independently review practical application, adversarial misuse, coherence
   and public hygiene against an exact candidate. Record findings and limitations;
   fix material findings and rerun affected reviews. Review-record additions
   receive a final exact-head check too. A simulated review is not field evidence.
7. Merge the linked PR only after the hosted validation passes. Inspect live
   protections rather than assuming CODEOWNERS enforces approval. This repository
   had no protected main at the audit baseline; no failure may be bypassed.
8. Fetch the merged main, compare its tree with the final reviewed candidate,
   rerun validation on the clean merged target, and confirm remote main matches.

## Publish

Use the approved clean merged target. Existing tags must never be moved. Retain
any configured signing requirement; the historical tags were unsigned annotated
tags and this repository has no additional signing requirement.

```sh
gh auth status --hostname github.com
test "$(gh api --hostname github.com user --jq .login)" = BradGroux
edition="$(cat VERSION)"
release_tag="v$edition"
test "${edition:0:10}" = "$(date -u +%Y.%m.%d)"
git tag -a "$release_tag" -m "Relationship Operating Framework $release_tag"
git push origin "refs/tags/$release_tag"
gh release create "$release_tag" --repo BradGroux/relationship-operating-framework --verify-tag --title "Relationship Operating Framework $release_tag" --notes-file "project/releases/$release_tag.md" --latest
./scripts/validate-release.sh "$release_tag"
```

Verify author, exact body, final state, tag object and peeled commit through API
and Git readback; check hosted main/tag runs and closed issue dispositions.
The committed publication body uses tag-qualified repository URLs so its links
also resolve on the GitHub release page. No release assets are required. Record final commit and release URL in the PR
or issue evidence without changing the release tree after review.

## Historical verification and failure

From the clean current checkout, run `./scripts/validate-release.sh v1.0.0` or
`./scripts/validate-release.sh v1.1.0`. Both verify annotated identity, remote
commit, author and published flags; v1.1.0 also checks its committed VERSION.
v1.0.0 predates VERSION and both historical public release bodies lack an exact
committed publication source. The verifier reports these limits; it does not
claim body equivalence or apply current content rules retroactively.

On failure, inspect remote state before retrying. An existing tag can be reused
only with the identical reviewed object and commit. Never delete/recreate or
force-push published history. A published correction uses a new dated edition
or same-day suffix and explains its predecessor. Calendar editions are a policy
of immutable publication; verify live settings separately from that policy.
