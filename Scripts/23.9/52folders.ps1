for ($i=1; $i -le 52; $i++){
    New-Item -Path . -Name "Viikko $($i)" -ItemType "directory"
}
