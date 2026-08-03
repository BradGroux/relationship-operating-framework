# Governance

- **Status:** Accepted initial governance
- **Founding steward:** Brad Groux
- **Effective date:** 2026-08-03

## Purpose

This document governs how the Relationship Operating Framework changes while
remaining people-first, independent, tool-replaceable, and accountable to its
[charter](framework/charter.md) and adopted [Open Framework Commons
v1.0.0](https://github.com/BradGroux/open-framework-commons/tree/v1.0.0).

## Authority

The public authority chain is:

1. [Charter](framework/charter.md).
2. This governance document.
3. Canonical [principles and boundaries](framework/principles-and-boundaries.md),
   [practice guide](framework/practice-guide.md), and
   [glossary](framework/glossary.md).
4. Accepted repository policies.
5. Examples, research, and review records.

The founding steward decides material framework changes and release baselines.
Contributors, maintainers, reviewers, teams, and agents may identify needs,
research, draft, apply, and review. They do not acquire governance authority by
doing that work.

Examples, research, tools, implementations, commercial work, and repeated
practice cannot change framework meaning silently.

## Change paths

### Editorial change

A correction that preserves meaning may be accepted through a focused pull
request, proportionate review, and link and publication-hygiene checks.

### Material framework change

A change to purpose, scope, principles, practice, defined terms, accountability,
agent authority, Relationship-versus-Influence boundaries, or evidence standards
requires:

1. a public issue stating the problem, evidence, alternatives, consequences,
   and unresolved questions;
2. classification against the charter and adopted Commons revision;
3. a prepared pull request updating every affected canonical document;
4. independent practical, adversarial, coherence, and public-hygiene review
   against an exact candidate commit;
5. a public disposition of every finding and material dissent; and
6. explicit steward approval in an identifiable semantic release.

### Charter or governance change

A charter amendment follows the charter's amendment rule. A material governance
change follows the material path and records who gains or loses authority,
transition conditions, effective date, and dissent.

### Example, research, or review record

These records require truthful status, provenance, source, limitations, privacy,
and publication-safety review. They remain non-normative unless a separate
material change incorporates a conclusion into canonical documents.

## Commons adoption and deviation

Relationship adopts Commons revisions explicitly, never automatically. An
adoption record must identify the Commons repository, semantic tag, exact peeled
commit, local documents affected, and any deviation.

A proposed Commons change remains outside Relationship authority. If local
practice reveals genuine cross-product friction, record the Relationship
evidence first. Propose a later Commons change only when the learning is shared
across the ecosystem rather than merely important to this product.

## Review standard

A material release receives four independent documentation reviews:

1. **Practical application** — can a new practitioner use the guidance in
   realistic cases without hidden systems or prior context?
2. **Adversarial misuse** — could the guidance authorize transactional,
   manipulative, invasive, scored, or autonomous treatment of people?
3. **Canonical coherence** — do charter, principles, practice, glossary,
   examples, research, governance, and explanatory visuals agree without
   absorbing Influence or creating a lifecycle, score, or system?
4. **Public hygiene** — are links, metadata, provenance, attribution, claims,
   personal information, local paths, private history, and rendered diagrams
   safe and usable to publish?

Each public report states its date, generic reviewer role, exact reviewed
commit, verdict, finding counts, evidence, verification, and limitations. Public
records exclude reviewer identities, agent or model names, local paths, prompts,
credentials, and private working history.

Finding severities are:

- **Blocker:** the framework is unusable or directly permits serious harm or a
  breach of its charter.
- **Material:** an omission or ambiguity is likely to change an ordinary
  stewardship decision.
- **Minor:** a bounded clarity, consistency, or publication issue unlikely to
  change the decision.
- **Suggestion:** optional improvement.

`GO` requires no unresolved Blocker or Material finding. The steward records a
disposition. Material fixes require affected reviews to run again against the
corrected candidate.

## Releases

Published versions use semantic versioning and annotated Git tags. Tags are
immutable by default. A same-version documentation republication requires an
explicit steward instruction, a public issue, disclosure of the prior and new
targets, complete review of the corrected candidate, a lease-protected tag
move, and refreshed release notes. A release identifies:

- the exact repository commit and date;
- the adopted Commons tag and peeled commit;
- material changes and known limitations;
- review records, dispositions, and unresolved dissent;
- superseded releases, if any; and
- the responsible steward.

Before tagging, verify status, diff, branch, remote, authorship, links,
navigation, citation and changelog metadata, public hygiene, and the required
review verdicts. After merge, compare the merged commit's tree with the reviewed
candidate. If content differs, rerun every affected check and review against the
merged commit before tagging.

No automated check, merge, version number, or agent decision overrides an
unresolved material finding or substitutes for steward approval.

### Version 1.0.0 baseline

- **Effective date:** 2026-08-03
- **Release form:** annotated tag `v1.0.0`; documentation-only republication
  authorized through [issue 3](https://github.com/BradGroux/relationship-operating-framework/issues/3)
  and [issue 4](https://github.com/BradGroux/relationship-operating-framework/issues/4)
- **Prior published tag target:**
  `ce7957143aa5eb3860b2fe81b63ec62a8857dbfb`
- **Reviewed replacement framework candidate:**
  `fec214099ea6479a675529b85657f429a6e3b3b5`
- **Final republished tag target:** recorded in the refreshed GitHub release after
  merge; its framework content must match the reviewed replacement candidate
- **Commons adoption:** `v1.0.0` at
  `a0f0d384e9010a65d1a21a324b4c912433d5e031`
- **Known limitations:** no longitudinal real-world validation; fictional
  examples; no domain, legal, privacy, safeguarding, organizational, or
  professional certification; first-user, first-job, lifecycle, domain-model,
  and Mission Control questions unresolved
- **Superseded same-version target:**
  `ce7957143aa5eb3860b2fe81b63ec62a8857dbfb`; no earlier semantic version
- **Responsible steward:** Brad Groux
- **Publication destination:**
  <https://github.com/BradGroux/relationship-operating-framework>

## Conflicts, dissent, and appeals

Record conflicting interpretations and material dissent with the decision. An
appeal identifies the disputed decision, grounds, evidence, and requested
resolution. Appeals go to the founding steward or a future governing body.

When the founding steward made the disputed decision and no broader body exists,
the steward records that limitation and seeks an uninvolved reviewer when
practical. The appeal does not suspend consent, privacy, do-not-contact, safety,
or legal boundaries while it is considered.

## Governance growth

Do not create committees, certifications, voting rules, compatibility levels,
or extension machinery before actual participation requires them. Review this
governance when contributor volume, recurring disputes, new maintainers, or
release experience shows a real need.
