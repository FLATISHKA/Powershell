Get-WmiObject -Class Win32_BIOS
Write-Host -NoNewline "Press any key"
$press = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');
