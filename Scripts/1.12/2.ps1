
Get-ChildItem ".\Tehtäväkansio\" -Recurse *.docx | Compress-Archive  -DestinationPath ".\2.zip"