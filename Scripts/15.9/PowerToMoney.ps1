[int]$Watt = Read-Host ("Anna laitteen teho watteina")
[int]$DailyUsageInHours = Read-Host ("Anna laiiteen päivittäinen käyttöaina tunteina")
[float]$ElectricityPrice = Read-Host ("Anna sähköhinta sentteinä per kilowattitunti (kWh)")

$DailyElectricityUsage = ($Watt * $DailyUsageInHours / 1000)
$DailyElectricityPrice = ($ElectricityPrice * $DailyElectricityUsage / 100)
$YearlyElectricPrice = ($DailyElectricityPrice * 365)

Write-host ("Päivittäinen kulutus on $($DailyElectricityUsage) kWh!")
Write-host ("Päivähinta on $($DailyElectricityPrice) euroa!")
Write-host ("Vuosikustannus on $($YearlyElectricPrice) euroa!")

Write-Host -NoNewline "Press any key to Exit"
$press = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');