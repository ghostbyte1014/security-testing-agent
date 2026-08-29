---
Document: What to Check — Local Development
Owner: ghostbyte
GitHub: https://github.com/ghostbyte1014
Last Updated: 2026-08-29
Phase: 2 of 12
---

# What to Check — Phase 2: Local Development

Reference checklist only — no result columns. Use `RESULTS_TEMPLATE.md` in
this same folder to actually record a test pass.

| # | Source file | Item | Severity | Example test |
|---|---|---|---|---|
| 1 | `08_Release_Engineering_Version_Control/01_secure_coding_guidelines.md` | Secure Coding Guidelines | Low | Confirm the team's secure-coding cheat sheet is linked from the PR template/onboarding docs, not just filed away unused. |
| 2 | `08_Release_Engineering_Version_Control/02_semantic_versioning.md` | Semantic Versioning | Low | Check the last 3 releases and confirm any breaking change actually bumped the MAJOR version. |
| 3 | `10_Dependency_Supply_Chain/01_backend_dependency_scanning.md` | Dependency & SCA Scanning | High | Run the SCA scanner manually against the current backend dependency tree and confirm it matches what CI reports, with no critical CVEs unpatched past SLA. |
| 4 | `10_Dependency_Supply_Chain/02_dependency_version_pinning.md` | Dependency Version Pinning | Medium | Delete the lockfile locally and reinstall; confirm CI fails the build if the regenerated lockfile differs from the committed one. |
| 5 | `10_Dependency_Supply_Chain/03_frontend_dependency_scanning.md` | Frontend Dependency Scanning | Medium | Run npm audit / yarn audit and manually review any newly added package for typosquatting risk or suspicious post-install scripts. |
| 6 | `06_Data_Protection_Secrets/06_secrets_management.md` | Secrets Management (added) | Critical | Run a secret-scanning tool (e.g. gitleaks/truffleHog) across the full git history, not just HEAD, and confirm zero committed credentials. |
| 7 | `09_Release_Pipeline_Stages/01_local_dev_testing.md` | Stage 1: Local / Developer Testing | Low | Confirm a fresh local dev environment setup never requires copying real production credentials or data. |
