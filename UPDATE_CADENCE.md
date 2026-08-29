---
Document: Update Cadence & Version Control
Owner: ghostbyte
GitHub: https://github.com/ghostbyte1014
Last Updated: 2026-08-29
---

# Update Cadence & Version Control

This file tracks **when** the master checklist should be refreshed and
**what has changed** across revisions. Keeping this separate from
`MASTER_CHECKLIST.md` means the checklist content itself stays clean while
this file carries the full history.

## Why an update cadence matters

Security guidance ages at different speeds depending on the layer:

- Vulnerability *classes* (SQLi, XSS, IDOR) are stable for years.
- The *tooling and specifics* around them (framework escape hatches, cloud
  IAM console details, mobile OS root-detection bypasses) shift every few
  months as platforms release new versions.
- *Standards references* (OWASP Top 10, OWASP API Security Top 10, NIST
  publications) get formally revised on their own multi-year cycles, but
  interim guidance and CVEs move continuously.

Treat the schedule below as a floor, not a ceiling — any of these can be
triggered early by an incident, a new CVE, or a major framework/OS release.

## Review schedule

| Frequency | Scope | Trigger |
|---|---|---|
| **Quarterly** | Dependency/CVE references (folder 10), OWASP Top 10 / API Top 10 alignment (folder 19), cloud IAM and console-specific steps (folder 07) | Calendar date |
| **Semi-annual** | Framework-specific sections (folder 04 — UI framework XSS sinks, build tooling), mobile OS security (folder 18 — jailbreak/root detection techniques) | Major framework or OS release (e.g. a new React/Angular major version, iOS/Android release) |
| **Annual** | Architecture & compliance mapping (folder 15), regulatory references, DNS/email standards (folder 17) | Regulatory cycle / annual compliance review |
| **Ad hoc — immediate** | Any section touched by the trigger event | A new CVE affecting your stack, a new OWASP Top 10 release, a real incident or near-miss whose lessons should be folded back in, a new red/purple team finding |

## How to run an update

1. Pick the section(s) due per the schedule above (or triggered by an event).
2. Re-verify each item's checklist, severity, and example test step against
   current guidance/tooling — don't just bump the date.
3. If a check is now obsolete (e.g. a deprecated framework API), mark it
   superseded rather than silently deleting it, so the version log stays
   traceable.
4. Update the `**Last reviewed:**` date on each changed item in
   `MASTER_CHECKLIST.md`.
5. Add a row to the **Version Log** below describing what changed.

## Version log

| Version | Date | Changed By | Summary of Changes |
|---|---|---|---|
| 1.0 | 2026-08-29 | ghostbyte | Initial consolidated restructure: merged 151 individual files across 19 domain folders into one `MASTER_CHECKLIST.md`; added severity ratings, concrete example test steps, last-reviewed dates, cross-links between related items, and authorization reminders on the three risk-sensitive folders (Web Vulnerabilities, Cloud Infra & Deployment, DNS/Email/Domain Security). Added this update-cadence file and a standardized results template. |
| 1.1 | 2026-08-29 | ghostbyte | Added `templates/` folder with 12 phase-scoped checklists (Design & Architecture → Local Dev → Database & Backend → API Layer → Frontend/UI → Application Security Testing → CI/CD & Release Engineering → Cloud Infrastructure → Edge/CDN/DNS → Release Rollout → Post-Release Monitoring & IR → Ongoing Operations), each pulling the relevant items straight out of `MASTER_CHECKLIST.md` with severity + example test intact. All 127 checklist items confirmed to appear in exactly one phase template. |
| 1.2 | 2026-08-29 | ghostbyte | Restructured `templates/` into `phases/` — each of the 12 phases is now a self-contained folder with its own `README.md` (when/why), `CHECKLIST.md` (what to check, reference only), and `RESULTS_TEMPLATE.md` (fillable, with sign-off block), so any single phase can be handed off independently. Coverage re-verified: all 127 items still appear in exactly one phase folder. |

*(Add a new row each time a review pass changes content — see "How to run an update" above.)*
