$leafPath = "io.github.clash-verge-rev.clash-verge-rev\verge.yaml"

if (Test-Path "$env:APPDATA\$leafPath" -PathType Leaf) {
    if (Test-Path ".\backup\old-configs\$leafPath" -PathType Leaf) {
        Remove-Item  -Path  ".\backup\old-configs\$leafPath" -Force -Recurse 
    }
    Move-Item -Path "$env:APPDATA\$leafPath" -Destination ".\backup\old-configs\$leafPath" -Force
}

Copy-Item -Path ".\config\$leafPath" -Destination "$env:APPDATA\$leafPath" -Recurse -Force


$leafPath = "io.github.clash-verge-rev.clash-verge-rev\profiles\Merge.yaml"
if (Test-Path "$env:APPDATA\$leafPath" -PathType Leaf) {
    if (Test-Path ".\backup\old-configs\$leafPath" -PathType Leaf) {
        Remove-Item  -Path  ".\backup\old-configs\$leafPath" -Force -Recurse 
    }
    Move-Item -Path "$env:APPDATA\$leafPath" -Destination ".\backup\old-configs\$leafPath" -Force
}

Copy-Item -Path ".\config\$leafPath" -Destination "$env:APPDATA\$leafPath" -Recurse -Force
