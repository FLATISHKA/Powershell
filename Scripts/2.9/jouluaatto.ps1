$d1 = Get-Date -Format "MM/dd/yyyy"
$d2 = '12-24-2021'
$ts = New-TimeSpan -Start $d1 -End $d2
$ts.Days
Write-Host -NoNewline "Press any key"
$press = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');
