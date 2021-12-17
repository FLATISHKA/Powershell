function SpaceFix() {
    if ($i -gt 9) { return "    " }else { return "     " }
}
[int]$amountOfRows = read-Host("Enter amount of rows")
function StickmanOnTheHill {
    param($val)
    if($val){Write-host " O `n-|-`n | `n/ \$(' ' * $amountOfRows)row  total" -fore red}
    else {Write-host "$(' ' * $amountOfRows) O `n-|-`n | `n/ \$(' ' * $amountOfRows)row  total"}
    $total = 0
    for ($i = 3; $i -le $amountOfRows; $i++) {
        $total += $i
        if($val){Write-host "$('#' * $i)$(' ' * ($amountOfRows - $i + 3)) $i     $($total)"}
        else
        {Write-host "$(' ' * ($amountOfRows - $i + 3))$('#' * $i)   $i     $($total)"}
    }
}
StickmanOnTheHill($true)
StickmanOnTheHill