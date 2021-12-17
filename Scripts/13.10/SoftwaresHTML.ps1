Get-WmiObject -Class Win32_Product | select Name, Version, Vendor, InstallDate | ConvertTo-Html | Out-File soft.htm
Invoke-Item soft.htm