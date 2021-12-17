[int]$Start = Read-Host("Alkuvuosi")
[int]$End = Read-Host("Loppuvuosi")

for ($y=$Start; $y -le $End; $y++){
    for($m=1; $m -le 12; $m++){
        for($d=1; $d -le [DateTime]::DaysInMonth($y, $m); $d++){
            $MonthName = (Get-Culture).DateTimeFormat.GetMonthName($m)
            $DayName = (Get-Culture).DateTimeFormat.GetDayName((get-date $m/$d/$y).DayOfWeek.value__)
            New-Item -Path ".\$y\$m - $MonthName" -Name "$d. $Dayname" -ItemType "directory"  
        }
    }
}