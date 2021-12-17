$Services = Get-Service

foreach ($Service in $Services) {
    If($Service.Status -eq "Running"){
        Write-Host $Service
    }
}

Write-Host -NoNewline "Press any key"
$press = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');