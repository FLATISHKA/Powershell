Get-Process | ConvertTo-Html | Out-File proc.htm
Invoke-Item proc.htm