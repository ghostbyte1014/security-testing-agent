---
Document: Results Template — Cloud Infrastructure & Deployment
Owner: ghostbyte
GitHub: https://github.com/ghostbyte1014
Phase: 8 of 12
---

# Test Pass: [date] — Phase 8: Cloud Infrastructure & Deployment

**System tested:** _______________________
**Tested by:** _______________________
**Date:** _______________________
**Authorization confirmed:** [ ] yes — approver: _______________________
**Checklist version used:** [see ../../UPDATE_CADENCE.md version log]

## Results

| # | Source file | Item | Severity | Example test | Result | Evidence / Notes |
|---|---|---|---|---|---|---|
| 1 | `07_Cloud_Infra_Deployment/01_environment_separation.md` | Environment Separation | Critical | Attempt to reach the staging environment unauthenticated from the public internet and confirm it requires auth or is not publicly indexable. | ☐ Pass ☐ Fail ☐ N/A | |
| 2 | `07_Cloud_Infra_Deployment/02_iam_policy_review.md` | Cloud IAM Policy Review | Critical | Export all IAM policies and grep for '*:*' or overly broad wildcard actions/resources; confirm each is justified or scoped down. | ☐ Pass ☐ Fail ☐ N/A | |
| 3 | `07_Cloud_Infra_Deployment/03_blue_green_canary_rollback.md` | Blue-Green / Canary Deployment & Rollback | High | Trigger a rollback in staging and time how long it takes to reach the previous stable version; compare against your defined rollback-time target. | ☐ Pass ☐ Fail ☐ N/A | |
| 4 | `07_Cloud_Infra_Deployment/04_container_k8s_security.md` | Container Orchestration (Kubernetes) Security | High | Run 'kubectl auth can-i --list' as a low-privilege service account and confirm it cannot perform cluster-admin-level actions. | ☐ Pass ☐ Fail ☐ N/A | |
| 5 | `07_Cloud_Infra_Deployment/05_cloud_storage_misconfig.md` | Cloud Storage Misconfiguration | Critical | List every storage bucket/container and confirm none allow anonymous public read/write except explicitly intended public assets. | ☐ Pass ☐ Fail ☐ N/A | |
| 6 | `07_Cloud_Infra_Deployment/06_infra_as_code_scanning.md` | Infrastructure-as-Code Scanning | High | Run an IaC scanner (e.g. tfsec/Checkov) against the current Terraform/CloudFormation config and confirm zero unresolved high/critical findings. | ☐ Pass ☐ Fail ☐ N/A | |
| 7 | `07_Cloud_Infra_Deployment/07_container_image_security.md` | Container Image Security | High | Run a CVE scanner (e.g. Trivy/Grype) against the production container image and confirm no unpatched critical CVEs, and that it isn't tagged 'latest'. | ☐ Pass ☐ Fail ☐ N/A | |
| 8 | `07_Cloud_Infra_Deployment/08_network_segmentation_cloud.md` | Cloud Network Segmentation | High | From a low-trust workload/VPC, attempt to reach a sensitive internal service directly and confirm network policy blocks it. | ☐ Pass ☐ Fail ☐ N/A | |
| 9 | `07_Cloud_Infra_Deployment/09_post_deploy_monitoring.md` | Post-Deployment Monitoring | Medium | During the next deploy, confirm an on-call owner is actively watching error-rate/latency dashboards for the defined post-deploy window. | ☐ Pass ☐ Fail ☐ N/A | |
| 10 | `07_Cloud_Infra_Deployment/10_feature_flag_safety.md` | Feature Flags & Kill Switches | Medium | Toggle a high-risk feature flag off in staging and confirm the code path is actually disabled immediately, not just hidden in the UI. | ☐ Pass ☐ Fail ☐ N/A | |
| 11 | `07_Cloud_Infra_Deployment/11_deploy_pipeline_iam_scoping.md` | Least-Privilege IAM for Deployment | Critical | Inspect the CI/CD service account's IAM role and confirm a staging-deploy credential cannot touch production resources. | ☐ Pass ☐ Fail ☐ N/A | |

## Summary

- Total items tested: _____ / 11
- Passed: _____
- Failed: _____
- Critical/High findings requiring action before this phase is signed off: _____

## Follow-up

| Finding | Severity | Owner | Target fix date | Status |
|---|---|---|---|---|
| | | | | |

## Phase sign-off

- Blocking further progress? [ ] Yes [ ] No
- Signed off by: _______________________  Date: _______________________

## Next scheduled pass

- Date:
- Trigger (calendar / event-driven — see ../../UPDATE_CADENCE.md):
