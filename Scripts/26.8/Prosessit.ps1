$Path = ".\prosessit.txt"
$A = Get-Process
if (-not(Test-Path -Path $Path -PathType Leaf)){
    New-Item -Path . -Name "prosessit.txt" -ItemType "file"
}
Clear-Content $Path
$Process = $A | Get-Process | Format-Table -View priority
$Process | Out-File -FilePath $Path -Append



