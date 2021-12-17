
Get-Item .\kuvat\* | ForEach-Object {
    $Name = ($_.Name)
    $GetExifDate = ((Get-ExifDateTaken ".\kuvat\$Name").exifdatetaken)
    $Year = $GetExifDate.Year
    $Month = $GetExifDate.Month
    $Day = $GetExifDate.Day
    New-Item -ItemType Directory -Path ".\Photos\$Year\$Month\$Day" -ErrorAction SilentlyContinue
    Copy-Item -Path ".\kuvat\$Name" -Destination ".\Photos\$Year\$Month\$Day\$Name" -Force
}
Write-Host -NoNewline "Press any key"
$press = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');
