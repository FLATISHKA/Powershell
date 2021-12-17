$Date = Get-Date -Format "dddd MM/dd/yyyy HH:mm"
Write-Host  "Current Date & Time: "$Date
Write-Host -NoNewline "Press any key"
$Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');