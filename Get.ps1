# 1. 检查管理员权限
if (-not ([Security.Principal.WindowsPrincipal] 
          [Security.Principal.WindowsIdentity]::GetCurrent()
         ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {

    Write-Host "Run as admin"
    exit
}

# 2. 检查 Git 是否安装
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git not found. Installing Git..."

    # 使用 winget 安装 Git（Windows 11 默认自带）
    winget install --id Git.Git -e --source winget

    # 安装后重新加载 PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" +
                [System.Environment]::GetEnvironmentVariable("Path","User")

    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        Write-Host "Git installation failed."
        exit
    }

    Write-Host "Git installed successfully."
}

# 3. 克隆或更新仓库
$repoUrl = "https://github.com/AlrayQiu/Dotfile"
$branch = "windows11"
$targetDir = "$env:USERPROFILE\Dotfile"

if (-not (Test-Path $targetDir)) {
    git clone -b $branch $repoUrl $targetDir
} else {
    Set-Location $targetDir
    git fetch origin
    git checkout $branch
    git pull origin $branch
}

# 4. 进入仓库并执行 setup.ps1
Set-Location $targetDir
./setup.ps1
