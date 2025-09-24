
if(Test-Path "$env:APPDATA\FlowLauncher\Settings" -PathType Container)
{
    if(Test-Path ".\backup\old-configs\FlowLauncher\Settings" -PathType Container)
    {
        Remove-Item  -Path  ".\backup\old-configs\FlowLauncher\Settings" -Force -Recurse 
    }
    Move-Item -Path "$env:APPDATA\FlowLauncher\Settings" -Destination ".\backup\old-configs\FlowLauncher\Settings" -Force
}

Copy-Item -Path ".\config\FlowLauncher\Settings" -Destination "$env:APPDATA\FlowLauncher\Settings" -Recurse -Force
