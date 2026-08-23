# Contributing

Contributions should make relationship stewardship clearer, safer, and more
useful without turning the framework into a system or a growth tactic.

## Participation and license

By submitting material for inclusion, a contributor agrees to license that
contribution under the repository's [MIT License](LICENSE) and confirms the
right to do so. Participation follows the [Code of Conduct](CODE_OF_CONDUCT.md).

Never publish personal data, private relationship notes, contact details,
private messages, confidential material, credentials, sensitive conduct
reports, or security details in an issue, pull request, example, research note,
or review. Use the [security and privacy policy](SECURITY.md) for private
reporting.

## Before proposing a change

1. Read the [charter](framework/charter.md), [principles and
   boundaries](framework/principles-and-boundaries.md), and [practice
   guide](framework/practice-guide.md).
2. Read the exact adopted [Open Framework Commons
   v1.1.0](https://github.com/BradGroux/open-framework-commons/tree/v1.1.0).
3. Decide whether the need is editorial, canonical, governance, an example,
   research, or a review record.
4. Explain the reader problem, evidence, alternatives, risks, limitations, and
   affected documents.
5. Check whether the idea belongs in Relationship, Commons, Influence, or an
   implementation. Keep it local when the shared need is unproven.
6. Remove unnecessary or unauthorized personal and organizational context.

Open a focused [GitHub
issue](https://github.com/BradGroux/relationship-operating-framework/issues/new)
for a proposal or question. Use a pull request when the change is prepared.

## Content standard

- Write for people making stewardship decisions, not for a particular tool.
- Keep requirements in canonical framework documents and scenario choices in
  examples.
- Separate source claim, evidence or example, interpretation, and open question.
- Label principles, experience, proposals, and validated findings honestly.
- Preserve follow-through, repair, waiting, closure, no action, and do not
  contact as valid outcomes.
- Keep agents subordinate to named human authority and exact-action approval.
- Do not introduce sales stages, scores, schemas, APIs, record formats,
  automation architecture, agent contracts, CI requirements, or
  machine-readable conformance into the framework method.
- Keep the initial first-user, first-job, lifecycle, domain-model, Mission
  Control, and extension ideas visibly non-normative unless governance accepts a
  later change.
- Use fictional examples unless the steward explicitly approves necessary,
  authorized, safely sourced real material.
- Add an inline Mermaid diagram only when it materially clarifies a relationship,
  decision, or authority boundary. Explain it in adjacent prose, keep it
  non-normative where appropriate, and commit no generated image export or
  diagram metadata.

Use uppercase filenames for repository-wide policies and lowercase kebab-case
inside content directories. Conventional directory indexes are named
`README.md`. Name dated review and research records
`<subject>-<record-type>-YYYY-MM-DD.md`. Reviewer names, agent or model names,
tool names, and internal platform names do not belong in public filenames.

## Decision and review

The [governance](GOVERNANCE.md) document defines change paths, review
perspectives, severities, and release approval. A contributor provides evidence
and a recommendation; the founding steward or future governing body decides.

Material changes must identify an exact candidate commit and receive practical,
adversarial, coherence, and public-hygiene review. Review records report what
was checked; they do not create new requirements.

## Verification checklist

Run the repository validation before submitting a change:

```sh
./scripts/validate-repository.sh
```

When Markdown contains Mermaid diagrams, also run:

```sh
./scripts/validate-mermaid.sh
```

Report these checks and any additional manual or tool-assisted checks used to
verify:

- repository status, diff, branch, remote, and authorship;
- every local Markdown link and heading reference;
- consistent canonical vocabulary and authority statements;
- exact Commons tag and peeled commit references;
- Relationship-versus-Influence boundaries;
- proposal labels and example provenance;
- Mermaid fence integrity, rendering, visual legibility, and consistency with
  the surrounding prose;
- public filenames, metadata, claims, and privacy hygiene; and
- any check that could not run and the resulting risk.

A successful documentation check does not prove real-world relationship quality
or certify an implementation.
