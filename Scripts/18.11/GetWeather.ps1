$Location = Read-Host Syötä Kaupungin nimi
$response = Invoke-WebRequest -Uri "https://wttr.in/$Location"
$response.Content