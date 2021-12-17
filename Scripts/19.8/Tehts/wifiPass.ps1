
$profiles = (netsh wlan show profiles | Select-String "All User Profile\s+:\s+(.*)").Matches.Groups | Where-Object { $_.Value -notmatch "All User Profile*" } | ForEach-Object {
    $wlan = netsh wlan show profiles name=$_ key=clear
    [pscustomobject][ordered]@{
        'SSID'           = ($wlan | Select-String "SSID Name\s+:\s+(.*)").Matches.Groups[1].Value
        'Radio Type'     = ($wlan | Select-String "Radio Type\s+:\s+(.*)").Matches.Groups[1].Value
        'Authentication' = ($wlan | Select-String "Authentication\s+:\s+(.*)").Matches.Groups[1].Value
        'Password'       = ($wlan | Select-String "Key Content\s+:\s+(.*)").Matches.Groups[1].Value
    }
} | Out-GridView -Title "Saved Wi-Fi passwords" -Passthru
    
