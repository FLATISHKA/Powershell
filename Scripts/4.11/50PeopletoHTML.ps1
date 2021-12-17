Import-Excel -Path .\50_people.xlsx | ConvertTo-Html | Out-File People.htm
Invoke-Item People.htm