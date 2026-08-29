---
Document: What to Check — CI/CD & Release Engineering
Owner: ghostbyte
GitHub: https://github.com/ghostbyte1014
Last Updated: 2026-08-29
Phase: 7 of 12
---

# What to Check — Phase 7: CI/CD & Release Engineering

Reference checklist only — no result columns. Use `RESULTS_TEMPLATE.md` in
this same folder to actually record a test pass.

| # | Source file | Item | Severity | Example test |
|---|---|---|---|---|
| 1 | `08_Release_Engineering_Version_Control/03_branch_protection_signed_commits.md` | Branch Protection & Signed Commits | High | Attempt to push directly to main without a PR/review and confirm the push is rejected by branch protection. |
| 2 | `08_Release_Engineering_Version_Control/04_artifact_integrity_provenance.md` | Build Artifact Integrity & Provenance | High | Verify the checksum/signature of the last deployed artifact against the one produced by the build pipeline and confirm they match. |
| 3 | `08_Release_Engineering_Version_Control/05_cicd_security.md` | CI/CD Pipeline Security | Critical | Check the CI/CD config for plaintext secrets and confirm all credentials are pulled from a vault/secrets manager instead. |
| 4 | `08_Release_Engineering_Version_Control/06_code_review_checklist.md` | Security Code Review Checklist | Medium | Pull the last 5 merged PRs and confirm each one's diff was checked against input validation, authZ, and no-secrets-in-diff criteria. |
| 5 | `08_Release_Engineering_Version_Control/07_changelog_release_notes.md` | Changelog & Release Notes | Low | Confirm the most recent release has a changelog entry, including any security-relevant fix noted without disclosing exploit specifics. |
| 6 | `08_Release_Engineering_Version_Control/08_deprecated_version_sunset_policy.md` | Deprecated Version & Sunset Policy | Medium | Call a documented end-of-life API version and confirm it's actually disabled, not silently still functional. |
| 7 | `14_Incident_Response_Security_Ops/05_sast_dast_tooling_integration.md` | SAST/DAST Tooling Integration | Medium | Confirm the last 10 PRs all triggered a SAST scan, and that staging received a DAST scan before its most recent production release. |
