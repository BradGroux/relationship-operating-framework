# Reviews

This directory preserves sanitized independent review records and maintainer
dispositions. A report evaluates the exact commit it names. It does not become
framework doctrine, prove real-world effectiveness, or certify an
implementation.

## Required perspectives

1. **Practical application** — usability in realistic fictional situations
   without hidden systems or prior planning context.
2. **Adversarial misuse** — resistance to transactional, manipulative, invasive,
   scored, autonomous, or sales-oriented misuse.
3. **Canonical coherence** — agreement across authority, vocabulary, practice,
   examples, research, Commons adoption, and the boundary with Influence.
4. **Public hygiene** — link and metadata integrity, truthful provenance and
   claims, role-only attribution, privacy, and absence of private history.

## Public review record standard

Use `<subject>-<record-type>-YYYY-MM-DD.md`. `README.md` is the only undated file
because it is a maintained index rather than a point-in-time record.

Each report contains:

- status, date, generic reviewer role, reviewed version, and exact commit;
- verdict and counts for Blocker, Material, Minor, and Suggestion findings;
- executive summary, findings, evidence, verification, limitations, and final
  verdict; and
- repository-relative `path:line` evidence evaluated against the named commit.

Public attribution is role-based. Reports and filenames exclude reviewer names,
agent or model names, tool names, internal platform details, local paths,
prompts, credentials, and private working history. Sanitization cannot change
the reviewed commit, verdict, severity, finding substance, or limitations.

## Severity and verdict

- **Blocker:** unusable or directly permits serious harm or a charter breach.
- **Material:** likely to change an ordinary stewardship decision.
- **Minor:** bounded clarity, consistency, or publication issue.
- **Suggestion:** optional improvement.

`GO` requires no unresolved Blocker or Material finding. A separate disposition
records the steward's decision and preserves material dissent.

## Version 1.0.0 documentation republication

Framework candidate reviewed on 2026-08-03:

- **Commit:** `fec214099ea6479a675529b85657f429a6e3b3b5`
- **Tree:** `5d7b9ada117c0b6f685fec4cadf234acdd08d9ae`
- **Prior published target:** `ce7957143aa5eb3860b2fe81b63ec62a8857dbfb`

| Perspective | Verdict | Findings |
|---|---|---|
| [Practical application](v1.0.0-visualization-practical-application-review-2026-08-03.md) | GO | None |
| [Adversarial misuse](v1.0.0-visualization-adversarial-misuse-review-2026-08-03.md) | GO | None |
| [Canonical coherence](v1.0.0-visualization-canonical-coherence-review-2026-08-03.md) | GO | None |
| [Public hygiene](v1.0.0-republication-public-hygiene-review-2026-08-03.md) | NO-GO | 1 Material |
| [Commons adoption refresh](v1.0.0-commons-adoption-refresh-review-2026-08-03.md) | GO | None |

The [republication review disposition](v1.0.0-visualization-review-disposition-2026-08-03.md)
records the public-hygiene finding, the corrective documentation, and the
required corrected-candidate reruns. The final replacement tag target must be
recorded in the refreshed GitHub release after merge-tree comparison.

## Initial version 1.0.0 publication

Corrected candidate reviewed on 2026-08-03:

- **Commit:** `6f25eb5419695aae4c33405f9d1f9983e67f84bb`
- **Tree:** `3e80faccd44612436e19279a71749b8d5099bcfd`

| Perspective | Verdict | Findings |
|---|---|---|
| [Practical application](v1.0.0-practical-application-review-2026-08-03.md) | GO | None |
| [Adversarial misuse](v1.0.0-adversarial-misuse-review-2026-08-03.md) | GO | None |
| [Canonical coherence](v1.0.0-canonical-coherence-review-2026-08-03.md) | GO | None |
| [Public hygiene](v1.0.0-public-hygiene-review-2026-08-03.md) | GO | 1 Suggestion |

The [review disposition](v1.0.0-review-disposition-2026-08-03.md) records the
initial candidate findings, their corrections, the final verdicts, and the
remaining release-time checks.
