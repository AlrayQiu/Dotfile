# Dotfile for Windows11

## 快速安装
```pwsh
Invoke-RestMethod "https://raw.githubusercontent.com/alrayqiu/dotfile/main/get.ps1" | Invoke-Expression
```

## 做了什么？
### 软件安装
- vscode
- python3.11 (for flow.plugin)
- flow launcher
- powershell 7
- windows terminal
- clash verge rev
- [可选] wsl2 && ubuntu-2204-wsl

### windows 清理
- 删除大部分无用的预装软件（详见[CustomAppslit](./config/Win11Debloat/CustomAppsList)，[Win11Debloat.ps1](./scripts/win11debloat.ps1)）
- 修改windows设置 (详见[SavedSettings](./config/Win11Debloat/SavedSettings))
- [可选] 删除windows-defender

### 配置迁移
- [FlowLauncher](./config/FlowLauncher/Settings/)
- [Win11Debloat](./config/Win11Debloat/)
- [wsl](./config/wsl/.wslconfig)

### 软件插件自动安装
#### FlowLauncher
- FendCalculator-1.1.1
- GitHub-1.3.1 
- Google Translate-1.1.1 
- Win Hotkey-4.0.0
