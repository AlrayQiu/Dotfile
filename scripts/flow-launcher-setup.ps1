
if(Test-Path "$env:APPDATA\FlowLauncher\Settings" -PathType Container)
{
    if(Test-Path ".\backup\old-configs\FlowLauncher\Settings" -PathType Container)
    {
        Remove-Item  -Path  ".\backup\old-configs\FlowLauncher\Settings" -Force -Recurse 
    }
    Move-Item -Path "$env:APPDATA\FlowLauncher\Settings" -Destination ".\backup\old-configs\FlowLauncher\Settings" -Force
}

Copy-Item -Path ".\config\FlowLauncher\Settings" -Destination "$env:APPDATA\FlowLauncher\Settings" -Recurse -Force

$PluginPath = "$env:APPDATA\FlowLauncher\Plugins"

# FendCalculator
Invoke-WebRequest `
    -Uri "https://github.com/IsaacTay/Flow.Launcher.Plugin.FendCalculator/releases/download/v1.1.1/Flow.Launcher.Plugin.FendCalculator.zip" `
    -OutFile "$env:Temp\FendCalculator.zip"
Remove-Item  -Path  "$PluginPath\FendCalculator*" -Force -Recurse 
Expand-Archive -Path "$env:Temp\FendCalculator.zip" -DestinationPath "$PluginPath\FendCalculator-1.1.1" -Force

# Github
Invoke-WebRequest `
    -Uri "https://github.com/JohnTheGr8/Flow.Plugin.Github/releases/download/v1.3.1/Flow.Plugin.Github.zip" `
    -OutFile "$env:Temp\Plugin-Github.zip"
Remove-Item  -Path  "$PluginPath\GitHub-*" -Force -Recurse 
Expand-Archive -Path "$env:Temp\Plugin-Github.zip" -DestinationPath "$PluginPath\GitHub-1.3.1" -Force

# winhotkey
Invoke-WebRequest `
    -Uri "https://github.com/AminSallah/Flow.Launcher.Plugin.WinHotkey/releases/download/v4.0.0/Flow.Launcher.Plugin.WinHotkey.zip" `
    -OutFile "$env:Temp\winhotkey.zip"
Remove-Item  -Path  "$PluginPath\Win Hotkey-*" -Force -Recurse 
Expand-Archive -Path "$env:Temp\winhotkey.zip" -DestinationPath "$PluginPath\Win Hotkey-4.0.0" -Force

# google translate
Invoke-WebRequest `
    -Uri "https://github.com/ralosant/FlowLauncher.Google.Translator" `
    -OutFile "$env:Temp\googletranslate.zip"
Remove-Item  -Path  "$PluginPath\Google Translate-*" -Force -Recurse 
Expand-Archive -Path "$env:Temp\googletranslate.zip" -DestinationPath "$PluginPath\Google Translate-1.1.1" -Force