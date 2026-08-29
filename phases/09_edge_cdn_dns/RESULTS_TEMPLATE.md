---
Document: Results Template — Edge, CDN & DNS
Owner: ghostbyte
GitHub: https://github.com/ghostbyte1014
Phase: 9 of 12
---

# Test Pass: [date] — Phase 9: Edge, CDN & DNS

**System tested:** _______________________
**Tested by:** _______________________
**Date:** _______________________
**Authorization confirmed:** [ ] yes — approver: _______________________
**Checklist version used:** [see ../../UPDATE_CADENCE.md version log]

## Results

| # | Source file | Item | Severity | Example test | Result | Evidence / Notes |
|---|---|---|---|---|---|---|
| 1 | `16_Edge_CDN_Security/01_waf_rules.md` | Cloudflare WAF Rules | High | Send a known attack pattern (e.g. a basic SQLi string) through the WAF in log mode first, confirm detection, then verify it's actually blocked once enforced. | ☐ Pass ☐ Fail ☐ N/A | |
| 2 | `16_Edge_CDN_Security/02_ddos_protection.md` | DDoS Protection | High | Confirm the true origin IP isn't discoverable/reachable directly, bypassing the CDN/DDoS layer entirely. | ☐ Pass ☐ Fail ☐ N/A | |
| 3 | `16_Edge_CDN_Security/03_bot_management.md` | Bot Management | Medium | Run a scripted login-attempt simulation against the login endpoint and confirm the bot-management layer flags/blocks it before it reaches the app. | ☐ Pass ☐ Fail ☐ N/A | |
| 4 | `16_Edge_CDN_Security/04_cdn_caching_authenticated_content.md` | CDN Caching of Authenticated Content | Critical | Request the same authenticated URL as two different logged-in users through the CDN and confirm User B never sees User A's cached response. | ☐ Pass ☐ Fail ☐ N/A | |
| 5 | `16_Edge_CDN_Security/05_cache_poisoning.md` | Web Cache Poisoning | Critical | Send a request with an unusual header (e.g. X-Forwarded-Host: evil.com) and confirm it can't influence what gets cached and served to other visitors. | ☐ Pass ☐ Fail ☐ N/A | |
| 6 | `16_Edge_CDN_Security/06_zero_trust_access.md` | Cloudflare Zero Trust / Access | Medium | Attempt to reach an internal app through the Zero Trust proxy without a valid per-app identity policy match and confirm access is denied. | ☐ Pass ☐ Fail ☐ N/A | |
| 7 | `17_DNS_Email_Domain_Security/01_dnssec.md` | DNSSEC | Medium | Run a DNSSEC validation check (e.g. via a public DNSSEC debugger) against the domain and confirm the chain resolves without validation errors. | ☐ Pass ☐ Fail ☐ N/A | |
| 8 | `17_DNS_Email_Domain_Security/02_spf_dkim_dmarc.md` | SPF, DKIM & DMARC | High | Send a test email through an online authentication checker and confirm SPF, DKIM, and DMARC all pass and align. | ☐ Pass ☐ Fail ☐ N/A | |
| 9 | `17_DNS_Email_Domain_Security/03_subdomain_takeover.md` | Subdomain Takeover (added) | Critical | Audit every CNAME record pointing at a third-party service and confirm none point to a deprovisioned/unclaimed resource that could be claimed by an attacker. | ☐ Pass ☐ Fail ☐ N/A | |
| 10 | `17_DNS_Email_Domain_Security/04_certificate_transparency_monitoring.md` | Certificate Transparency Monitoring | Medium | Query crt.sh for the domain and confirm every listed certificate maps to a known, authorized issuance process. | ☐ Pass ☐ Fail ☐ N/A | |

## Summary

- Total items tested: _____ / 10
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
