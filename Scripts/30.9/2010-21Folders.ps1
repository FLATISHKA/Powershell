for ($y=10; $y -le 21; $y++){
    New-Item -Path . -Name "20$($y)" -ItemType "directory"
    for($m=1; $m -le 12; $m++){
        New-Item -Path ".\20$($y)" -Name $m -ItemType "directory"
        for($d=1; $d -le 31; $d++){
            New-Item -Path ".\20$($y)\$($m)" -Name $d -ItemType "directory"  
        }
    }
}
