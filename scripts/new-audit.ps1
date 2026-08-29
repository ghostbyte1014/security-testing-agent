<#
===============================================================================
  SECURITY TESTING AGENT — QUICK AUDIT STARTER (PowerShell)
===============================================================================
.SYNOPSIS
    Automates creating a dated security audit results file and generates a
    ready-to-use prompt for your AI coding assistant.

.PURPOSE
    - Eliminates manual work: Avoids manually copying and renaming RESULTS_TEMPLATE.md files.
    - Prevents accidental overwrites: Automatically stamps results with today's date (YYYY-MM-DD).
    - Bridges to AI Agents: Outputs an exact, evidence-focused prompt formatted for
      LLM coding assistants (Claude Code, Antigravity, Copilot, Cursor, etc.).

.WORKFLOW
    1. Run this script with a target phase number/name (e.g. 04 or 04_api_layer).
    2. The script creates 'phases/<phase>/RESULTS_YYYY-MM-DD.md' if it doesn't already exist.
    3. Copy the printed prompt into your AI agent to begin the security audit.

.PARAMETER Phase
    The phase number (01-12), phase folder name (e.g., 04_api_layer), or 'all' for root master audit.

.EXAMPLE
    .\scripts\new-audit.ps1 04
    .\scripts\new-audit.ps1 04_api_layer
    .\scripts\new-audit.ps1 all
===============================================================================
#>

param (
    [Parameter(Position = 0, Mandatory = $false)]
    [string]$Phase
)

$today = Get-Date -Format "yyyy-MM-dd"
$repoRoot = Split-Path -Parent $PSScriptRoot

$phases = @{
    "01" = "01_design_architecture"
    "02" = "02_local_development"
    "03" = "03_database_backend"
    "04" = "04_api_layer"
    "05" = "05_frontend_ui"
    "06" = "06_application_security_testing"
    "07" = "07_cicd_release_engineering"
    "08" = "08_cloud_infrastructure"
    "09" = "09_edge_cdn_dns"
    "10" = "10_release_rollout"
    "11" = "11_post_release_monitoring_ir"
    "12" = "12_ongoing_operations"
}

if (-not $Phase) {
    Write-Host "`n=======================================================" -ForegroundColor Cyan
    Write-Host "  🛡️  Security Testing Agent — Audit Starter" -ForegroundColor Cyan
    Write-Host "=======================================================`n" -ForegroundColor Cyan
    Write-Host "Usage: .\scripts\new-audit.ps1 <phase_number_or_name>`n" -ForegroundColor Yellow
    Write-Host "Available Phases:" -ForegroundColor White
    foreach ($key in ($phases.Keys | Sort-Object)) {
        Write-Host "  [$key] $($phases[$key])" -ForegroundColor Gray
    }
    Write-Host "  [all] Full Master Checklist (Root)`n" -ForegroundColor Gray
    $Phase = Read-Host "Enter Phase number or name (e.g. 04 or all)"
}

if ($Phase -eq "all" -or $Phase -eq "master") {
    $templatePath = Join-Path $repoRoot "RESULTS_TEMPLATE.md"
    $targetPath = Join-Path $repoRoot "RESULTS_$today.md"
    $checklistPath = "MASTER_CHECKLIST.md"
    $targetRelative = "RESULTS_$today.md"
} else {
    $matchedPhase = $null
    if ($phases.ContainsKey($Phase)) {
        $matchedPhase = $phases[$Phase]
    } else {
        foreach ($val in $phases.Values) {
            if ($val -like "*$Phase*") {
                $matchedPhase = $val
                break
            }
        }
    }

    if (-not $matchedPhase) {
        Write-Host "❌ Error: Phase '$Phase' not recognized." -ForegroundColor Red
        exit 1
    }

    $phaseDir = Join-Path $repoRoot "phases\$matchedPhase"
    $templatePath = Join-Path $phaseDir "RESULTS_TEMPLATE.md"
    $targetPath = Join-Path $phaseDir "RESULTS_$today.md"
    $checklistPath = "phases/$matchedPhase/CHECKLIST.md"
    $targetRelative = "phases/$matchedPhase/RESULTS_$today.md"
}

if (-not (Test-Path $templatePath)) {
    Write-Host "❌ Error: Template file not found at: $templatePath" -ForegroundColor Red
    exit 1
}

if (Test-Path $targetPath) {
    Write-Host "⚠️  Notice: $targetRelative already exists for today ($today). Not overwriting." -ForegroundColor Yellow
} else {
    Copy-Item -Path $templatePath -Destination $targetPath
    Write-Host "✅ Created new audit file: $targetRelative" -ForegroundColor Green
}

Write-Host "`n=======================================================" -ForegroundColor Cyan
Write-Host "  🤖 Prompt to copy and give to your AI Coding Agent:" -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host @"

Read $checklistPath.
Review the codebase against every checklist item. For each item:
1. Search for actual code evidence (cite specific file:line or command output).
2. Determine Result: Pass, Fail, or N/A.
3. If Fail, assign a suggested Owner and Remediation Due date.
4. Record your findings directly into $targetRelative.
Do not guess. If an item cannot be verified locally, mark N/A and document why in the Notes column.

"@ -ForegroundColor White
Write-Host "=======================================================`n" -ForegroundColor Cyan
