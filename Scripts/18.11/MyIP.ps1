$response = Invoke-WebRequest -Uri 'https://api.myip.com'
$Content = $response.Content | ConvertFrom-Json

write-host "Your external ip address is $($Content.ip)"