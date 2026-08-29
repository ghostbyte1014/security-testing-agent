---
Document: Agentic Automation Guide
Owner: ghostbyte
GitHub: https://github.com/ghostbyte1014
Last Updated: 2026-08-29
---

# Agentic Automation Guide — Running This Checklist With an AI Coding Agent

This guide covers running the checklist inside your code editor using an
agentic coding assistant (e.g. Claude Code) instead of working through it
by hand. No CI/CD required — this works entirely from your editor.

## 1. Drop the checklist into your repo

Put this whole folder somewhere stable in your codebase, e.g.:

```
docs/security-checklist/
```

Keeping it under version control means the checklist travels with the code
it's checking, and results files become part of your project history.

## 2. Know what an editor-based agent can actually check

An agent running in your editor only has access to your source code (and
whatever shell/CLI credentials you give it) — not a live running system by
default. Split phases by what's realistically checkable this way:

| Can check directly (reads code) | Needs a live system to check properly |
|---|---|
| Phase 1 — Design & Architecture (docs, data flow diagrams) | Phase 8 — Cloud Infra (needs cloud console/CLI access) |
| Phase 2 — Local Development (secrets in code, lockfiles) | Phase 9 — Edge/CDN/DNS (needs DNS/CDN provider access) |
| Phase 3 — Database & Backend (ORM usage, business logic) | Phase 10 — Release Rollout (needs deploy pipeline access) |
| Phase 4 — API Layer (auth checks, JWT validation logic) | Phase 11 — Post-Release Monitoring (needs logs/SIEM access) |
| Phase 5 — Frontend/UI (XSS sinks, build config exposure) | |
| Phase 6 — App Security Testing (some grep-able patterns) | |
| Phase 7 — CI/CD & Release Engineering (config files, branch rules) | |
| Phase 12 — Ongoing Operations (partial — vendor/mobile docs) | |

Start with Phases 1–7 for pure code-review automation. For the "needs a
live system" phases, either grant the agent read-only CLI/API credentials
for that system, or run those phases manually using the same checklist.

## 3. Run a phase manually with a one-off prompt

Open your agentic coding tool in the project and give it a prompt like this
(swap in the phase folder and target date):

```
Read docs/security-checklist/phases/04_api_layer/CHECKLIST.md.
Go through every item against this codebase — search for the relevant
code, decide Pass/Fail/N/A with a one-line reason citing the file/line
you checked, and write the results into
docs/security-checklist/phases/04_api_layer/RESULTS_TEMPLATE.md
(save as RESULTS_2026-08-29.md so it doesn't overwrite the blank template).
Flag anything you're not confident about rather than guessing.
```

Repeat this per phase folder as you touch that part of the codebase — you
don't need to run all 12 every time.

## 4. Make it repeatable — a custom slash command

Most agentic coding tools support project-level custom commands stored in
the repo itself, so you don't have to re-type the prompt every time.

Create `.claude/commands/security-check.md` in your project root:

```markdown
Run the security checklist for phase: $ARGUMENTS

1. Read docs/security-checklist/phases/$ARGUMENTS/CHECKLIST.md
2. For each item, search the actual codebase for evidence
3. Write Pass/Fail/N/A + a one-line reason per item, citing the file/line checked
4. Save results to docs/security-checklist/phases/$ARGUMENTS/RESULTS_$(date +%Y-%m-%d).md
5. Summarize Critical/High failures at the end of the run
6. Flag anything uncertain rather than guessing a Pass
```

Then from your editor, running a phase becomes a single command, e.g.:

```
/security-check 04_api_layer
```

## 5. Build it into your natural workflow

Since there's no CI/CD trigger doing this automatically, tie each phase to
a moment you're already at in your workflow instead of a schedule:

| Trigger point | Run this phase |
|---|---|
| Before committing any change | `02_local_development` |
| After adding/editing an endpoint | `04_api_layer` |
| After touching frontend components | `05_frontend_ui` |
| Before opening a PR | `06_application_security_testing`, `07_cicd_release_engineering` |
| Before a first deploy to a new environment | `08_cloud_infrastructure` (manual or with cloud CLI access) |
| On the cadence defined in `UPDATE_CADENCE.md` | `12_ongoing_operations` and any phase flagged "ad hoc" |

This turns the checklist into something you run a few focused times per
week rather than one large audit you keep postponing.

## 6. For more accurate execution — a few practical tips

- **Give the agent real evidence to cite, not vibes.** Ask it to quote the
  specific file/line or grep match backing each Pass/Fail, not just a
  verdict — this makes results reviewable later and catches the agent
  guessing.
- **Run Critical/High items twice if a phase gates a release.** Agents can
  miss things on a single pass; a second, independent pass on just the
  Critical/High rows before something ships is cheap insurance.
- **Never let the agent mark "Pass" on something it couldn't actually
  verify** (e.g. a live cloud IAM policy it has no access to check) — tell
  it explicitly to use N/A + a note instead, so gaps don't get silently
  hidden as passes.
- **Keep every dated results file, don't overwrite.** Save each run as
  `RESULTS_YYYY-MM-DD.md` so you can track whether the same failure keeps
  recurring across passes — that's usually a signal of a design problem,
  not a one-off bug.
- **Grant the minimum access needed for live-system phases.** If you do
  connect the agent to cloud/DNS/CI credentials for Phases 8–11, scope
  those credentials to read-only where possible — the agent is checking
  your security posture, it doesn't need write access to verify it.
- **Feed real incidents back in.** If a phase pass misses something that
  later caused a real bug or incident, add a line to that phase's
  `CHECKLIST.md` and log the change in `UPDATE_CADENCE.md` — this is what
  keeps the checklist accurate over time instead of going stale.
