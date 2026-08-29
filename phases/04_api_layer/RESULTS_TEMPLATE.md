---
Document: Results Template — API Layer
Owner: ghostbyte
GitHub: https://github.com/ghostbyte1014
Phase: 4 of 12
---

# Test Pass: [date] — Phase 4: API Layer

**System tested:** _______________________
**Tested by:** _______________________
**Date:** _______________________
**Authorization confirmed:** [ ] yes — approver: _______________________
**Checklist version used:** [see ../../UPDATE_CADENCE.md version log]

## Results

| # | Source file | Item | Severity | Example test | Result | Evidence (file:line / proof) | Notes |
|---|---|---|---|---|---|---|---|
| 1 | `01_API_Security/01_rate_limiting.md` | Rate Limiting | High | Fire 200 requests/sec at a login endpoint from one IP and confirm 429s with Retry-After start well before account lockout thresholds are reachable. | ☐ Pass ☐ Fail ☐ N/A | | |
| 2 | `01_API_Security/02_api_keys.md` | API Keys | High | Grep the built client bundle and mobile binary for hardcoded key patterns, then rotate one key and confirm the old value is rejected within minutes. | ☐ Pass ☐ Fail ☐ N/A | | |
| 3 | `01_API_Security/03_oauth2.md` | OAuth 2.0 | Critical | Attempt the authorization flow with a modified redirect_uri (e.g. attacker.com) and confirm the server rejects it rather than redirecting. | ☐ Pass ☐ Fail ☐ N/A | | |
| 4 | `01_API_Security/04_jwt_validation.md` | JWT Validation | Critical | Submit a token with 'alg' changed to 'none' and an empty signature; confirm the API rejects it instead of trusting the claims. | ☐ Pass ☐ Fail ☐ N/A | | |
| 5 | `01_API_Security/05_input_sanitation.md` | Input Sanitation | High | Submit oversized, wrong-type, and boundary values (e.g. negative quantity, 10k-char string) on every field and confirm consistent server-side rejection. | ☐ Pass ☐ Fail ☐ N/A | | |
| 6 | `01_API_Security/06_cors_policy.md` | CORS Policy | High | Send a fetch with Origin: https://evil.com and credentials:'include'; confirm the Access-Control-Allow-Origin response does not reflect evil.com. | ☐ Pass ☐ Fail ☐ N/A | | |
| 7 | `01_API_Security/07_mtls.md` | Mutual TLS (mTLS) | Medium | Present an expired or self-signed client certificate to the mTLS endpoint and confirm the connection is rejected, not silently accepted. | ☐ Pass ☐ Fail ☐ N/A | | |
| 8 | `01_API_Security/08_request_signing.md` | Request Signing | Medium | Replay a previously captured signed request unmodified after its timestamp window; confirm it is rejected as a replay. | ☐ Pass ☐ Fail ☐ N/A | | |
| 9 | `01_API_Security/09_ip_allowlisting.md` | IP Allowlisting | Medium | Send a request from a disallowed IP with a spoofed X-Forwarded-For header set to an allowlisted IP and confirm it is still blocked. | ☐ Pass ☐ Fail ☐ N/A | | |
| 10 | `01_API_Security/10_security_headers.md` | Security Headers (added) | Medium | Run curl -I against each public endpoint and confirm CSP, HSTS, X-Content-Type-Options, and frame-ancestors are all present. | ☐ Pass ☐ Fail ☐ N/A | | |
| 11 | `03_Access_Control_Session_Auth/07_session_management.md` | Session Management (added) | High | Capture the session cookie before and after login and confirm the session ID value actually changes (regenerates) rather than persisting. | ☐ Pass ☐ Fail ☐ N/A | | |
| 12 | `03_Access_Control_Session_Auth/08_mfa.md` | Multi-Factor Authentication (added) | Critical | Attempt the password-reset flow and confirm it cannot be used to fully log in while skipping the MFA step. | ☐ Pass ☐ Fail ☐ N/A | | |
| 13 | `03_Access_Control_Session_Auth/09_session_store_caching.md` | Session Store Security (Redis/Memcached) | High | Attempt to connect directly to the Redis/Memcached session store from outside the app network and confirm authentication is required and it isn't publicly reachable. | ☐ Pass ☐ Fail ☐ N/A | | |
| 14 | `03_Access_Control_Session_Auth/10_remember_me_persistent_login.md` | "Remember Me" & Persistent Login Tokens | High | Use a captured remember-me token once, then reuse the same (now-rotated-out) token value again and confirm it triggers revocation/alerting rather than silent success. | ☐ Pass ☐ Fail ☐ N/A | | |
| 15 | `03_Access_Control_Session_Auth/06_forced_reauth_sensitive_actions.md` | Forced Re-Authentication for Sensitive Actions | High | From an already-logged-in session, attempt to change the account email/password without re-entering credentials and confirm it's blocked. | ☐ Pass ☐ Fail ☐ N/A | | |
| 16 | `03_Access_Control_Session_Auth/03_cache_invalidation_on_auth_change.md` | Cache Invalidation on Auth/Privilege Change | High | Downgrade a test user's role, then immediately retry a privileged action with their still-active session and confirm it's now denied. | ☐ Pass ☐ Fail ☐ N/A | | |
| 17 | `03_Access_Control_Session_Auth/04_device_trust_fingerprinting.md` | Device Trust & Fingerprinting | Medium | Replay a captured device-trust identifier from a different browser/device and confirm it does not skip MFA. | ☐ Pass ☐ Fail ☐ N/A | | |

## Summary

- Total items tested: _____ / 17
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
