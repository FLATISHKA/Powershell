Import-Excel -Path .\50_people.xlsx -WorkSheetname Sheet1 -DataOnly -HeaderName 'First Name', 'Last Name' | Sort-Object -Property @{Expression = "Last Name"; Descending = $false}