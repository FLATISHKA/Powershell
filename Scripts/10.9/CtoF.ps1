$C = Read-Host ("Anna muunnettava lämpötila celsiusasteina")
$F = ($C / 5 * 9 + 32)
Write-Host $F

Write-Host -NoNewline "Press any key"
$press = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');