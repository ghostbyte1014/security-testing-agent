#!/usr/bin/env bash
# ===============================================================================
#   SECURITY TESTING AGENT — QUICK AUDIT STARTER (Bash)
# ===============================================================================
# PURPOSE:
#   - Eliminates manual work: Avoids manually copying and renaming RESULTS_TEMPLATE.md files.
#   - Prevents accidental overwrites: Automatically stamps results with today's date (YYYY-MM-DD).
#   - Bridges to AI Agents: Outputs an exact, evidence-focused prompt formatted for
#     LLM coding assistants (Claude Code, Antigravity, Copilot, Cursor, etc.).
#
# WORKFLOW:
#   1. Run this script with a target phase number/name (e.g. 04 or 04_api_layer).
#   2. The script creates 'phases/<phase>/RESULTS_YYYY-MM-DD.md' if it doesn't already exist.
#   3. Copy the printed prompt into your AI agent to begin the security audit.
#
# USAGE:
#   ./scripts/new-audit.sh 04
#   ./scripts/new-audit.sh 04_api_layer
#   ./scripts/new-audit.sh all
# ===============================================================================

set -e

TODAY=$(date +%Y-%m-%d)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

declare -A PHASES=(
  ["01"]="01_design_architecture"
  ["02"]="02_local_development"
  ["03"]="03_database_backend"
  ["04"]="04_api_layer"
  ["05"]="05_frontend_ui"
  ["06"]="06_application_security_testing"
  ["07"]="07_cicd_release_engineering"
  ["08"]="08_cloud_infrastructure"
  ["09"]="09_edge_cdn_dns"
  ["10"]="10_release_rollout"
  ["11"]="11_post_release_monitoring_ir"
  ["12"]="12_ongoing_operations"
)

PHASE="$1"

if [ -z "$PHASE" ]; then
  echo ""
  echo "======================================================="
  echo "  🛡️  Security Testing Agent — Audit Starter"
  echo "======================================================="
  echo "Usage: ./scripts/new-audit.sh <phase_number_or_name>"
  echo ""
  echo "Available Phases:"
  for k in $(echo "${!PHASES[@]}" | tr ' ' '\n' | sort); do
    echo "  [$k] ${PHASES[$k]}"
  done
  echo "  [all] Full Master Checklist (Root)"
  echo ""
  read -p "Enter Phase number or name (e.g. 04 or all): " PHASE
fi

if [ "$PHASE" = "all" ] || [ "$PHASE" = "master" ]; then
  TEMPLATE_PATH="$REPO_ROOT/RESULTS_TEMPLATE.md"
  TARGET_PATH="$REPO_ROOT/RESULTS_$TODAY.md"
  CHECKLIST_PATH="MASTER_CHECKLIST.md"
  TARGET_REL="RESULTS_$TODAY.md"
else
  MATCHED_PHASE=""
  if [ -n "${PHASES[$PHASE]}" ]; then
    MATCHED_PHASE="${PHASES[$PHASE]}"
  else
    for val in "${PHASES[@]}"; do
      if [[ "$val" == *"$PHASE"* ]]; then
        MATCHED_PHASE="$val"
        break
      fi
    done
  fi

  if [ -z "$MATCHED_PHASE" ]; then
    echo "❌ Error: Phase '$PHASE' not recognized."
    exit 1
  fi

  PHASE_DIR="$REPO_ROOT/phases/$MATCHED_PHASE"
  TEMPLATE_PATH="$PHASE_DIR/RESULTS_TEMPLATE.md"
  TARGET_PATH="$PHASE_DIR/RESULTS_$TODAY.md"
  CHECKLIST_PATH="phases/$MATCHED_PHASE/CHECKLIST.md"
  TARGET_REL="phases/$MATCHED_PHASE/RESULTS_$TODAY.md"
fi

if [ ! -f "$TEMPLATE_PATH" ]; then
  echo "❌ Error: Template file not found at: $TEMPLATE_PATH"
  exit 1
fi

if [ -f "$TARGET_PATH" ]; then
  echo "⚠️  Notice: $TARGET_REL already exists for today ($TODAY). Not overwriting."
else
  cp "$TEMPLATE_PATH" "$TARGET_PATH"
  echo "✅ Created new audit file: $TARGET_REL"
fi

echo ""
echo "======================================================="
echo "  🤖 Prompt to copy and give to your AI Coding Agent:"
echo "======================================================="
cat << EOF

Read $CHECKLIST_PATH.
Review the codebase against every checklist item. For each item:
1. Search for actual code evidence (cite specific file:line or command output).
2. Determine Result: Pass, Fail, or N/A.
3. If Fail, assign a suggested Owner and Remediation Due date.
4. Record your findings directly into $TARGET_REL.
Do not guess. If an item cannot be verified locally, mark N/A and document why in the Notes column.

EOF
echo "======================================================="
