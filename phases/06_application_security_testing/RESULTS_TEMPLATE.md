---
Document: Results Template — Application Security Testing (QA / Staging)
Owner: ghostbyte
GitHub: https://github.com/ghostbyte1014
Phase: 6 of 12
---

# Test Pass: [date] — Phase 6: Application Security Testing (QA / Staging)

**System tested:** _______________________
**Tested by:** _______________________
**Date:** _______________________
**Authorization confirmed:** [ ] yes — approver: _______________________
**Checklist version used:** [see ../../UPDATE_CADENCE.md version log]

## Results

| # | Source file | Item | Severity | Example test | Result | Evidence (file:line / proof) | Notes |
|---|---|---|---|---|---|---|---|
| 1 | `02_Web_Vulnerabilities/01_sql_injection.md` | SQL Injection | Critical | Submit a single quote and boolean/time-based payloads (e.g. ' OR '1'='1, SLEEP(5)) in every input field and inspect responses/timing for injection signals. | ☐ Pass ☐ Fail ☐ N/A | | |
| 2 | `02_Web_Vulnerabilities/04_ssrf.md` | Server-Side Request Forgery (SSRF) | Critical | Submit a URL-fetching parameter pointing at http://169.254.169.254/latest/meta-data/ and confirm the server does not fetch it. | ☐ Pass ☐ Fail ☐ N/A | | |
| 3 | `02_Web_Vulnerabilities/05_idor.md` | Insecure Direct Object Reference (IDOR) | Critical | Log in as User A, capture an object ID from a request, then repeat the identical request as User B and confirm access is denied. | ☐ Pass ☐ Fail ☐ N/A | | |
| 4 | `02_Web_Vulnerabilities/08_path_traversal.md` | Path Traversal | Critical | Submit ../../../../etc/passwd and URL-encoded/unicode variants in any file-path parameter and confirm access stays within the intended directory. | ☐ Pass ☐ Fail ☐ N/A | | |
| 5 | `02_Web_Vulnerabilities/09_insecure_deserialization.md` | Insecure Deserialization | Critical | Tamper with a serialized object/cookie (flip a field, change a type) and submit it; confirm the server rejects it rather than deserializing blindly. | ☐ Pass ☐ Fail ☐ N/A | | |
| 6 | `02_Web_Vulnerabilities/10_broken_authentication.md` | Broken Authentication | Critical | Run a scripted credential-stuffing pass against the login endpoint using a small known-breached credential list and confirm lockout/rate-limit triggers. | ☐ Pass ☐ Fail ☐ N/A | | |
| 7 | `02_Web_Vulnerabilities/11_ssti.md` | Server-Side Template Injection (SSTI) (added) | Critical | Submit template syntax such as {{7*7}} or ${7*7} into user-controlled text fields and check whether the output evaluates to 49. | ☐ Pass ☐ Fail ☐ N/A | | |
| 8 | `02_Web_Vulnerabilities/12_xxe.md` | XML External Entity (XXE) Injection (added) | Critical | Submit an XML payload with a DOCTYPE defining an external entity pointing to a local file and confirm the parser refuses to resolve it. | ☐ Pass ☐ Fail ☐ N/A | | |
| 9 | `02_Web_Vulnerabilities/13_mass_assignment.md` | Mass Assignment (added) | High | Add an unexpected field such as "isAdmin": true to a normal profile-update request body and confirm it is ignored, not applied. | ☐ Pass ☐ Fail ☐ N/A | | |
| 10 | `02_Web_Vulnerabilities/14_race_conditions.md` | Race Conditions (added) | High | Fire 20 identical concurrent requests at a discount/redeem endpoint and confirm only one succeeds, not all twenty. | ☐ Pass ☐ Fail ☐ N/A | | |
| 11 | `02_Web_Vulnerabilities/15_request_smuggling.md` | HTTP Request Smuggling (added) | Critical | Send a request with conflicting Content-Length and Transfer-Encoding headers through the full proxy chain and observe whether front-end/back-end parsing disagrees. | ☐ Pass ☐ Fail ☐ N/A | | |
| 12 | `19_Security_Checklists/01_owasp_top10_checklist.md` | OWASP Top 10 Checklist | Reference | Use this as a coverage tracker after running folders 01-18 — check off each OWASP Top 10 category once its dedicated checklist items have been executed. | ☐ Pass ☐ Fail ☐ N/A | | |
| 13 | `19_Security_Checklists/02_api_security_checklist.md` | OWASP API Security Top 10 Checklist | Reference | Use this as a coverage tracker after running folder 01 (API_Security) and relevant items from 02/03 — confirm each OWASP API Top 10 category is addressed. | ☐ Pass ☐ Fail ☐ N/A | | |
| 14 | `19_Security_Checklists/03_pentest_checklist.md` | Penetration Test Checklist (added) | Reference | Use this as the top-level structure for any full engagement: confirm scope/RoE are signed before folder-by-folder testing begins. | ☐ Pass ☐ Fail ☐ N/A | | |

## Summary

- Total items tested: _____ / 14
- Passed: _____
- Failed: _____
- Critical/High findings requiring action before this phase is signed off: _____

## Follow-up (Actionable Remediation)

| Finding / Item | Severity | Owner | Remediation Due | Status |
|---|---|---|---|---|
| | | | | |

## Phase sign-off

- Blocking further progress? [ ] Yes [ ] No
- Signed off by: _______________________  Date: _______________________

## Next scheduled pass

- Date:
- Trigger (calendar / event-driven — see ../../UPDATE_CADENCE.md):
