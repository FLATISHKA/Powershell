For($i=10; $i -gt 0; $i--){
    write-host $i
}


Write-Host -NoNewline "Press any key"
$press = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');