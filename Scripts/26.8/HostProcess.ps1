$Path = ".\HostProcess.txt"
$A = Get-Process
if (-not(Test-Path -Path $Path -PathType Leaf)){
    New-Item -Path . -Name "HostProcess.txt" -ItemType "file"
}
Clear-Content $Path
$env:COMPUTERNAME | Out-File -FilePath $Path -Append
$Process = $A | Get-Process | Format-Table -View priority
$Process | Out-File -FilePath $Path -Append
