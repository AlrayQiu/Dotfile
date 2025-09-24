
wsl --install --no-distribution
wsl --install Ubuntu-24.04


if(Test-Path "$env:HOMEPATH\.wslconfig" -PathType Leaf)
{
    if(Test-Path ".\backup\old-configs\wsl\.wslconfig" -PathType Leaf)
    {
        Remove-Item  -Path  ".\backup\old-configs\wsl\.wslconfig" -Force -Recurse 
    }
    Move-Item -Path "$env:HOMEPATH\.wslconfig" -Destination ".\backup\old-configs\wsl\.wslconfig" -Force
}

Copy-Item -Path ".\config\wsl" -Destination "$env:HOMEPATH" -Recurse -Force
