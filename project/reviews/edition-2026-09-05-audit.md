# Calendar edition audit and disposition

- **Date:** 2026-09-05
- **Baseline:** `afa195b576cfd35b219e9d905cd013af6fc265b7`
- **Status:** Remediated and independently reviewed content; final tree and publication gates remain separate
- **Scope:** Entire tracked repository, prior reviews/decisions, Git history,
  releases, closed issues and relevant PR discussion; live main and identity

## Prioritized findings and tracker

| Issue | Evidence at baseline | Impact and disposition |
|---|---|---|
| [10](https://github.com/BradGroux/relationship-operating-framework/issues/10) | Charter mission/scope; principles re-engagement; practice commitments/repair; handoff example | Material ambiguities: earned help, alternative-channel contact, promise over withdrawal, incomplete capacity/retention paths. Corrected canonical choices and examples; no observed harm asserted. |
| [11](https://github.com/BradGroux/relationship-operating-framework/issues/11) | VERSION, governance Releases, adoption Decision 0001 | Owner-requested prospective calendar editions and independent Commons adoption, not an alleged defect in historical semantic releases. Accepted through Decision 0002, with substantive compatibility and preserved history. |
| [12](https://github.com/BradGroux/relationship-operating-framework/issues/12) | Markdown fragment skip and filesystem existence check; hardcoded release file; release verifier HEAD/current-VERSION requirement and omitted body/author | Verified validation gaps. Added indexed-target/fragment checks, real calendar dates, active metadata and explicit repository/author/body readback, with historical limits. |

The baseline had no open issues. Closed issues 1, 3, 4, 7 and 8 and associated
PRs describe completed historical work, not a current mandate to copy sibling
tooling or recreate old releases. Historical review findings retain their
original severity and verdict. No sensitive exploit or credential was found
requiring a public security disclosure. Sensitive reports still use SECURITY.md;
the private reporting setting was verified enabled.

## Adverse content cases

These are fictional, maintainer-assessed interpretation tests. They do not
supply practitioner, specialist, longitudinal or field evidence.

| Case | Decision in corrected guidance | Evidence |
|---|---|---|
| Newcomer requests help with no prior contribution | Legitimate request; recipient may explain capacity without demanding reciprocity | Charter commitments; practice Ask for help |
| Manager offers mentoring contingent on personal disclosure | Do not attach ordinary support or opportunity to personal access; recognize refusal may be costly | Principles Consent; practice power guidance |
| Quiet former collaborator does not respond | No motive inference, manual chasing, channel switch or intermediary workaround | Principles Re-engagement; example 01 |
| Promised guide after refusal of successor introduction | Distinguish introduction permission from current delivery permission; check before sending | Example 02 |
| Promised guide or apology after do-not-contact | Pause contact; handle any unresolved duty through its authorized private process | Practice commitments and repair |
| Two obligations exceed capacity | Narrow, renegotiate, authorized handoff or stop; no universal duty ranking or promise to satisfy both | Practice Honor commitments |
| Sensitive note disputed but retention duty exists | Restrict use/access, preserve dispute, consult designated authority; retention grants no reuse | Practice truthful continuity |
| Assistant infers motives or tracks changing personal circumstances | Reject speculative persuasion and continuous monitoring; use minimum authorized context for a real decision | Practice context and assistant boundaries |
| Steward wants to finish without another record or message | No new record if no legitimate retention need; no final contact required | Start small; commitments and repair |
| Team imports private Focus journals or Influence growth targets | No authority transfer or compulsory shared record, funnel or productivity system | Charter independence and anti-scope |

## Repository and security applicability

This is documentation with a few local validation scripts, not an application.
There is no service API, database, runtime data flow, persisted relationship
store, authentication subsystem, concurrency engine, deployed application,
production package dependency or performance workload. These categories are
not applicable; adding them would violate scope. Repository script temporary
files, process errors, downloads, CI permissions and release integrity do apply.

Existing CI is read-only, uses a commit-pinned checkout action and executes no
secrets or publishing step on pull requests. Main was unprotected at baseline;
CODEOWNERS routes ownership but cannot prove enforcement. No repository setting
is silently represented as protected. Mermaid uses an exact development CLI
version but unlocked transitive downloads; reproducibility and browser behavior
remain limitations, not proof of a discovered dependency vulnerability. No
runtime dependency or sibling build system was added.

The improved validator is deliberately bounded to this repository's Markdown
conventions; it is not a general CommonMark implementation or proof of all
publication safety. Human review covers meaning, private history, fictional
identities and unsupported claims. Ordinary Markdown prose explains each diagram
so understanding does not depend on rendering. The handoff diagram now says to
check current permission before promised contact and requires visual review.

## Adoption and historical preservation

[Decision 0002](../../decisions/0002-calendar-editions-and-commons-adoption.md)
records verified Commons provenance, local compatibility and no deviations.
Influence's exact cited v1.0.0 charter and Focus's current charter were read for
material boundary interactions; no other product was changed. No parser or
consumer of a package/schema version exists in the tracked repository.

Preserve these tag identities:

| Tag | Annotated object | Peeled commit |
|---|---|---|
| v1.0.0 | `4ad69305234c0da7cf6ab903e1f1fe0157cc4976` | `0c90cb23ccb5fd4616ae3c6dac86216cbfd69d36` |
| v1.1.0 | `ff8b6a32c7e4fd5b1faf7e0ea642d370b79fe6b0` | `afa195b576cfd35b219e9d905cd013af6fc265b7` |

The older historical republication records remain untouched. Current verification
reports unavailable exact legacy release-body sources rather than asserting
body equivalence. No dated alias or downstream adoption is created.

## Evidence limits and optional follow-up

Chosen values and adverse cases justify the bounded corrections; they do not
prove usefulness in real relationships. No unmet field-study requirement is
closed as verified. Future consented practitioner feedback, including safe exit,
power differences and record burden, remains a research opportunity owned by
the steward, to revisit when authorized evidence exists. A dependency lock and
stronger hosted protection policy are optional repository improvements, not
imported Commons obligations or evidence that current content is ineffective.

## Independent review and verification

Initial exact candidate: `0a24b40bfc3d27cc166814e902864424d448ea49`.

| Independent role/perspective | Result | Disposition |
|---|---|---|
| Content: practical application | GO, no findings | Fictional adverse cases support bounded decisions; no field claim. |
| Content: adversarial misuse | GO, no findings | No-contact, no earned help, privacy, capacity and human authority preserved. |
| Content: canonical coherence/specification | GO, no findings | Commons adoption and independent product boundaries agree. |
| Standards and public hygiene | One Material publication-navigation finding | Release notes used repository-relative links despite verbatim publication. Corrected to immutable tag-qualified URLs; affected review reruns before merge. |

The content reviewer checked help and power (practice guide Ask for help),
conflicting obligations and closure (Honor commitments; Repair or close),
disputed notes (Preserve truthful continuity), silence (principles
Re-engagement), handoff consent (example 02), and authority/proposals (charter).
The standards reviewer independently ran repository validation, the ten
regression cases and the redacted history scan. It inspected tracked public
content, scripts, CI, history preservation and release operations.

Maintainer verification completed on the corrected working candidate:

- 47 Markdown files passed links, fragments, indexed targets and Mermaid fences.
- Ten isolated regression tests passed, including invalid fragments, untracked
  and symlink targets, impossible dates, zero correction suffix and stale metadata.
- All nine diagrams in seven documents compiled; the changed handoff diagram
  received rendered browser inspection and its current-permission text is legible.
- Redacted full-history and candidate-archive secret scans passed.
- The resolved development diagram dependency audit reported zero known
  vulnerabilities; this is time-specific and does not lock future installations.
- Citation structure, calendar/date consistency, shell syntax and diff checks passed.
- Historical tag/readback gates passed for v1.0.0 and v1.1.0 with the stated
  unavailable-body-source limits. Historical changelog/governance blocks, prior
  review files, release notes and Decision 0001 are unchanged.
- Issue bodies, labels and authors were read back as the intended content,
  with BradGroux identity and no available GitHub App attribution.

The complete head, including this report and the release-link correction,
requires final independent follow-up. Final review, hosted checks, merged-tree
equality, annotated tag and published-body readback are recorded in the linked
PR and release operation evidence. This report does not preclaim publication.
