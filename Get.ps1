
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $setupPath = Join-Path $PSScriptRoot 'setup.ps1'
    Write-Host "Run as admin"
    exit
}
