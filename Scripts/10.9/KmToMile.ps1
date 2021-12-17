$Kilometers = Read-Host ("Anna kilometrit jotka muutetaan maileiksi")
$Miles =  0.62137 * $Kilometers
Write-Host $Miles

Write-Host -NoNewline "Press any key"
$press = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');