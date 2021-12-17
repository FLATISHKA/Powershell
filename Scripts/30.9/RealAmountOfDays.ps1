
for ($y=2010; $y -le 2021; $y++){
    New-Item -Path . -Name $y -ItemType "directory"
    for($m=1; $m -le 12; $m++){
        New-Item -Path ".\$y" -Name $m -ItemType "directory"
        for($d=1; $d -le [DateTime]::DaysInMonth($y, $m); $d++){
            New-Item -Path ".\$y\$m" -Name $d -ItemType "directory"  
        }
    }
}