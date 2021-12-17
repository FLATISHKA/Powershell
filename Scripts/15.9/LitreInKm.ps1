[float]$AverageFuelConsumption = Read-Host ("Anna autosi keskimääräinen polttoaineen kulutus litroina 100km kohti")
$Kilometers = Read-Host ("Anna ajettava matka kilometreinä")

$Result = ($AverageFuelConsumption * $Kilometers / 100)

Write-Host ("Lakettu polttoineen kulutus on $($Result) litraa $($Kilometers) km matkalla")

Write-Host -NoNewline "Press any key to Exit"
$press = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');