
while ($true) {
    Start-Sleep -s 5
    Get-Counter >> Counter.txt
}
