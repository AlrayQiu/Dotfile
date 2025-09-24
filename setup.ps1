# install apps
. '.\scripts\install-software.ps1'      # apps
. '.\scripts\install-wsl.ps1'           # wsl
. '.\scripts\flow-launcher-setup.ps1' # flow luancher

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $setupPath = Join-Path $PSScriptRoot 'setup.ps1'
    Write-Host "Run sudo pwsh $setupPath"
    exit
}


# Set scope for setup
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

# uninstall

# debloat
. '.\scripts\win11debloat.ps1'           # windows
. '.\scripts\remove-windowsdefender.ps1' # windows defender

