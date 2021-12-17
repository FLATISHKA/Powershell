Get-ChildItem -Path C:\Windows\System32 -Include *.dll -Recurse -Force 2> .\error.txt | Select-Object -Property Name, Directory | Format-List >> .\result.txt  

