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

## Coordinated Open Framework Commons v1.0.0 pin refresh

Corrected candidate reviewed on 2026-08-03:

- **Commit:** `3f93ee84f8bb069c49668c482497c6a043a68522`
- **Tree:** `8eb6ce9910c34b3d0a80feab6a52e55063401801`

The consolidated
[coordinated refresh review](open-framework-commons-v1.0.0-coordinated-refresh-review-2026-08-03.md)
records separate standards and specification passes. Both returned GO with no
open findings after one Material release-history omission was corrected.

## Version 1.0.0 record

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
