#requires -Version 5.1
<#
.SYNOPSIS
  Read-only baseline checks for the local Active Directory lab.
.DESCRIPTION
  Run on the domain controller in an elevated PowerShell session.
  This script does not repair settings or modify directory objects.
#>

[CmdletBinding()]
param(
    [string]$DomainName = "skrillsam.org"
)

$ErrorActionPreference = "Continue"
$results = [System.Collections.Generic.List[object]]::new()

function Add-CheckResult {
    param(
        [string]$Name,
        [bool]$Passed,
        [string]$Detail
    )
    $results.Add([pscustomobject]@{
        Check  = $Name
        Status = if ($Passed) { "PASS" } else { "REVIEW" }
        Detail = $Detail
    })
}

Write-Host "Hybrid Identity Lab - read-only health checks" -ForegroundColor Cyan
Write-Host "Target domain: $DomainName"
Write-Host "Computer: $env:COMPUTERNAME"
Write-Host ""

# Check core services when running on a domain controller.
foreach ($serviceName in @("NTDS", "DNS", "Netlogon")) {
    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
    if ($null -eq $service) {
        Add-CheckResult -Name "Service: $serviceName" -Passed $false -Detail "Service not found on this machine; confirm this is the domain controller."
    }
    else {
        Add-CheckResult -Name "Service: $serviceName" -Passed ($service.Status -eq "Running") -Detail "Current state: $($service.Status)"
    }
}

# Verify AD cmdlets are available before querying the directory.
if (Get-Command Get-ADDomain -ErrorAction SilentlyContinue) {
    try {
        $domain = Get-ADDomain -Identity $DomainName -ErrorAction Stop
        Add-CheckResult -Name "Active Directory domain query" -Passed $true -Detail "DNS root: $($domain.DNSRoot); NetBIOS: $($domain.NetBIOSName)"
    }
    catch {
        Add-CheckResult -Name "Active Directory domain query" -Passed $false -Detail $_.Exception.Message
    }
}
else {
    Add-CheckResult -Name "Active Directory PowerShell module" -Passed $false -Detail "Get-ADDomain is unavailable. Run on a system with the AD DS PowerShell tools installed."
}

# Run a focused DNS diagnostic when dcdiag is available.
$dcdiag = Get-Command dcdiag.exe -ErrorAction SilentlyContinue
if ($dcdiag) {
    Write-Host "Running dcdiag /test:dns /v (review detailed output below)..." -ForegroundColor Yellow
    & $dcdiag.Source /test:dns /v
    $exitCode = $LASTEXITCODE
    Add-CheckResult -Name "dcdiag DNS test" -Passed ($exitCode -eq 0) -Detail "dcdiag exit code: $exitCode; review output above for warnings."
}
else {
    Add-CheckResult -Name "dcdiag DNS test" -Passed $false -Detail "dcdiag.exe is unavailable on this machine."
}

Write-Host ""
Write-Host "Summary" -ForegroundColor Cyan
$results | Format-Table -AutoSize -Wrap

$reviewCount = @($results | Where-Object Status -eq "REVIEW").Count
Write-Host ""
Write-Host "Checks needing review: $reviewCount"
Write-Host "This script is diagnostic only. Investigate findings before changing configuration."
