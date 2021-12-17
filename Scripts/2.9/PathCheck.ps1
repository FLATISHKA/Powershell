If (Test-Path -Path "C:\Users") {
    Write-host "kansio on olemassa"
    "{0:N2} GB" -f ((Get-ChildItem "C:\Users" -Recurse | Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1GB) 
}
else {
    write-host "kansio ei ole olemassa"
}
Write-Host -NoNewline "Press any key"
$press = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');