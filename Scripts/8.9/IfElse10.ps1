$Number = 10

if($Number -gt 10){
    Write-Host "Muuttujan arvo on isompi kuin 10!"
}elseif ($Number -eq 10) {
    Write-Host "Muuttujan arvo on tasan 10!"
}else{
    Write-Host "Muuttujan arvo on pienempi kuin 10!"
}

Write-Host -NoNewline "Press any key"
$press = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');