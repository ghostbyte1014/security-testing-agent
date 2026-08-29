---
Document: Security Testing Agent — Consolidated Reference
Owner: ghostbyte
GitHub: https://github.com/ghostbyte1014
Last Updated: 2026-08-29 13:04 PHT (UTC+8)
Version: 1.0
---

# Security Testing Agent — Consolidated Reference

This folder is a security testing/review checklist — **not exploit code**.
Every entry describes *what to check for*, not *how to attack* something,
and points to standard public references (OWASP, NIST, etc.) for the
underlying concepts.

Originally 151 separate files across 19 domain folders, now consolidated
into three documents so it's easier to hand to an agent, read end to end,
or keep under version control:

| File / Folder | Purpose |
|---|---|
| **`MASTER_CHECKLIST.md`** | The full checklist — all 19 domains, one file. Each item has what it is, why it matters, the test checklist, a severity rating, a concrete example test step, a last-reviewed date, and cross-links to related items. |
| **`phases/`** | 12 self-contained phase folders ordered to match a development lifecycle (design → code → deploy → ongoing ops). Each folder has its own `README.md` (when/why), `CHECKLIST.md` (what to check), and `RESULTS_TEMPLATE.md` (where to record a pass) — see `phases/README.md` for the full list. |
| **`scripts/`** | Helper CLI scripts (`new-audit.ps1` & `new-audit.sh`) to automatically generate today's dated audit results file and print the prompt for your AI agent. |
| **`UPDATE_CADENCE.md`** | How often each part of the checklist should be reviewed, what triggers an early update, and the version/change log. |
| **`RESULTS_TEMPLATE.md`** | Standardized format for recording pass/fail findings from a full, all-domain pass — separate from the per-phase templates in `phases/`. |

## Quick Start: 1-Click Audit Helper

Instead of manually copying templates and dates, run the helper script:

**Windows (PowerShell):**
```powershell
.\scripts\new-audit.ps1 04_api_layer
# Or for a full pass:
.\scripts\new-audit.ps1 all
```

**Linux / macOS (Bash):**
```bash
./scripts/new-audit.sh 04_api_layer
# Or for a full pass:
./scripts/new-audit.sh all
```

The script automatically generates `RESULTS_YYYY-MM-DD.md` in that phase folder and outputs the exact prompt ready to hand to your AI coding assistant.

## How to use it manually

**Option A — by phase (recommended for day-to-day use):**
1. Open `phases/README.md`, find the phase matching where you are right
   now (e.g. "API Layer" while building an endpoint, "Cloud Infrastructure &
   Deployment" before a first deploy).
2. Open that phase's folder — read its `README.md`, work through
   `CHECKLIST.md`, and record results in a copy of `RESULTS_TEMPLATE.md`
   (e.g. save it as `RESULTS_2026-08-29.md` so history isn't overwritten).
3. Use the sign-off block at the bottom of the results file before moving on.

**Option B — full pass (for periodic audits or a complete review):**
1. Open `MASTER_CHECKLIST.md` and jump to the domain(s) relevant to what
   you're building or reviewing (table of contents at the top).
2. Turn each checklist bullet into an actual test using its **Example test**
   line as a starting point.
3. Record results in a copy of the root `RESULTS_TEMPLATE.md` — keep "what
   to test" (this checklist) separate from "what we found" (your results file).
4. Check `UPDATE_CADENCE.md` before relying on an older copy of this
   folder — confirm you're not past due for a refresh on the section you're using.

## Scope & safety

- Only point testing (yours or an agent's) at systems you own or have
  explicit written permission to test.
- The **Web Vulnerabilities**, **Cloud Infra & Deployment**, and
  **DNS, Email & Domain Security** sections carry an authorization reminder
  in `MASTER_CHECKLIST.md` because their checks can have live side effects —
  prefer staging/QA over production for those.
- Compliance-related items (folder 15) are a starting checklist, not legal
  advice — confirm interpretation with qualified counsel.
