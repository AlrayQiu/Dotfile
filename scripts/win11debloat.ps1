

if(Test-Path "$env:TEMP\Win11Debloat" -PathType Container)
{
    if(Test-Path ".\backup\old-configs\Win11Debloat" -PathType Container)
    {
        Remove-Item  -Path  ".\backup\old-configs\Win11Debloat" -Force -Recurse 
    }
    Move-Item -Path "$env:TEMP\Win11Debloat" -Destination ".\backup\old-configs\" -Force
}

Copy-Item -Path ".\config\Win11Debloat" -Destination "$env:TEMP\Win11Debloat" -Recurse -Force


Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Raphire/Win11Debloat/refs/heads/master/Get.ps1" -OutFile "$env:TEMP\Win11Debloat.ps1"
Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File `"$env:TEMP\Win11Debloat.ps1`" -RunSavedSettings" -Verb RunAs -Wait

Get-AppxPackage -allusers *bing* | Remove-AppxPackage
Get-AppxPackage -allusers *onedrive* | Remove-AppxPackage
Get-AppxPackage -allusers *todo* | Remove-AppxPackage
Get-AppxPackage -allusers *Family*  | Remove-AppxPackage
Get-AppxPackage -allusers *Devhome* | Remove-AppxPackage
Get-AppxPackage -allusers *GameAssist* | Remove-AppxPackage

Get-appxpackage -allusers *windowsalarms* | Remove-AppxPackage
Get-appxpackage -allusers *windowscommunicationsapps* | Remove-AppxPackage
Get-appxpackage -allusers *CandyCrushSodaSaga* | Remove-AppxPackage
Get-appxpackage -allusers *solitairecollection* | Remove-AppxPackage

