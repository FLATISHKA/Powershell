Get-ChildItem C:\Windows\System32 -Filter "*.dll" | Select-object -property Name,Directory,VersionInfo | ConvertTo-Html | Out-File dlls.htm
Invoke-Item dlls.htm