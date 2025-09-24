
$answer = Read-Host "remove WindowsDefender? (y/[ANY]n)"

if ($answer -eq 'y') {
    Invoke-WebRequest -Uri "https://github.com/ionuttbara/windows-defender-remover/releases/download/release_def_12_8_4/DefenderRemover.exe" -OutFile "$env:TEMP\DefenderRemover.exe"
    Start-Process $env:TEMP\DefenderRemover.exe -ArgumentList "/R" -Verb RunAs -Wait
    Write-Host "✅ WindowsDefender removed"
} else {
    Write-Host "keep windows denfender"
    exit
}