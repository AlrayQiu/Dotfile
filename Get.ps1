
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $setupPath = Join-Path $PSScriptRoot 'setup.ps1'
    Write-Host "Run as admin"
    exit
}
# 如果是管理员，则执行以下内容
$repoUrl = "https://github.com/AlrayQiu/Dotfile"
$branch = "windows11"
$targetDir = "$env:USERPROFILE\Dotfile"

# 如果目录不存在则克隆
if (-not (Test-Path $targetDir)) {
    git clone -b $branch $repoUrl $targetDir
} else {
    # 如果存在则更新
    Set-Location $targetDir
    git fetch origin
    git checkout $branch
    git pull origin $branch
}

# 进入仓库并执行 setup.ps1
Set-Location $targetDir
./setup.ps1
