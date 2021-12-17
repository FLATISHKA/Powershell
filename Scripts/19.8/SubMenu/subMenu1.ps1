. "./Tehts/Youtube.ps1"
. "./Tehts/wifiPass.ps1"

function subMenu1 { 
    $subMenu = 'X'
    while ($subMenu -ne ''){
        Clear-Host
        Write-Host "First Day Menu"
        Write-Host -NoNewLine " `n["; Write-Host -NoNewLine "1"; Write-Host -NoNewLine "]"; `
            Write-Host " Youtube SubMenu"
        Write-Host -NoNewLine " `n["; Write-Host -NoNewLine "2"; Write-Host -NoNewLine "]"; `
            Write-Host " Wifi Passwords"
        $subMenu = Read-Host "`nSelection (Leave blank to quit)"
        if($subMenu -eq 1){
            $subMenu = ''
            youTube
            

        }
        if($subMenu -eq 2){
            $subMenu = ''
            wifiPass
        }
    }

}


