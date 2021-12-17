Get-Item .\Tehtäväkansio\* | ForEach-Object {
    $FullName = ($_.FullName)
    $Ext = ($_.Extension).substring(1)
    New-Item -ItemType Directory -Path ".\Sorted\$Ext" -ErrorAction SilentlyContinue
    Copy-Item -Path "$FullName" -Destination ".\Sorted\$Ext" -Force
}