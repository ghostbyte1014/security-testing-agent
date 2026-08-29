---
Document: Phase 6 — Application Security Testing (QA / Staging)
Owner: ghostbyte
GitHub: https://github.com/ghostbyte1014
Last Updated: 2026-08-29 13:04 PHT (UTC+8)
Phase: 6 of 12
---

# Phase 6: Application Security Testing (QA / Staging)

**When to run this:** A dedicated security test pass in QA/staging before release — after features are functionally complete.

**Goal of this pass:** Run the deeper, often-automatable vulnerability classes end to end against a real running build, and confirm coverage against recognized baselines (OWASP Top 10 / API Top 10).

## Files in this folder

| File | Purpose |
|---|---|
| `CHECKLIST.md` | What to check — the reference list of items, severity, and example test steps for this phase. Doesn't get filled in; copy it or use `RESULTS_TEMPLATE.md` to record a real pass. |
| `RESULTS_TEMPLATE.md` | Fillable version of the same checklist, with Result/Notes columns and a sign-off block. Copy this file per test pass (e.g. `RESULTS_2026-08-29.md`) so history isn't overwritten. |

Full background, "why it matters," and references for every item live in
`../../MASTER_CHECKLIST.md` (search for the source file path shown in the
checklist below).

## Sign-off criteria

- All Critical/High severity items must Pass or have an approved exception
  before this phase is considered complete.
- Total items in this phase: 14
