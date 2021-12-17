Get-Process | Select-Object -Property ProcessName, StartTime| Sort-Object -Property starttime
Get-Service | Select-Object -Property Name, Status| Sort-Object -Property Status