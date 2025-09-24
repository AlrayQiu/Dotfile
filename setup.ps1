if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $setupPath = Join-Path $PSScriptRoot 'setup.ps1'
    Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File `"$setupPath`"' -Verb RunAs -Wait
    exit
}


# Set scope for setup
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

# Setup

# debloat
. '.\scripts\install-software.ps1' # apps
. '.\scripts\win11debloat.ps1' # windows
. '.\scripts\install-wsl.ps1' # wsl
. '.\scripts\flow-launcher-plugins.ps1'
