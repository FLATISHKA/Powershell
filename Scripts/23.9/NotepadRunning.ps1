while ($true) {
    $ProcessActive = Get-Process notepad -ErrorAction SilentlyContinue
    if ($ProcessActive -eq $null) {
        Write-host "Notepad not runing"
    }
    else {
        Write-host "Notepad running"
    }
    start-sleep -s 3
}
