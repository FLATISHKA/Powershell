$BuildVerion = [System.Environment]::OSVersion.Version.Build
write-host ($BuildVerion)
if($BuildVerion -eq 19043){
    write-host "Käytössäsi on Windows build 19043!"
}else{
    Write-Host("Käytössäsi on Windows koontiversio ", $BuildVerion)
}

Write-Host -NoNewline "Press any key"
$press = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');
