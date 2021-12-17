
Get-Item .\kuvat\* | ForEach-Object {
    $i = 1
    $Name = ($_.Name)
    $GetExifDate = ((Get-ExifDateTaken ".\kuvat\$Name").exifdatetaken)
    $Year = $GetExifDate.Year
    $Month = $GetExifDate.Month
    $Day = $GetExifDate.Day
    $MonthName = (Get-Culture).DateTimeFormat.GetMonthName($Month)
    $DayName = (Get-Culture).DateTimeFormat.GetDayName((get-date $Month/$Day/$Year).DayOfWeek.value__)
    New-Item -ItemType Directory -Path ".\Photos\$Year\$Month - $Monthname\$Day. $DayName" -ErrorAction SilentlyContinue
    while((Test-Path -Path ".\Photos\$Year\$Month - $Monthname\$Day. $DayName\$Month.$Day.$Year ($i).jpg") -eq $true){$i++; write-host "$Month.$Day.$Year ($i).jpg already exist" -fore red}
    Copy-Item -Path ".\kuvat\$Name" -Destination ".\Photos\$Year\$Month - $Monthname\$Day. $DayName\$Month.$Day.$Year ($i).jpg" -Force
}
