$Numbers = Read-host "Enter some numbers"
$Amount = ([regex]::Matches($Numbers, " " )).count + 1
$Average = ((($Numbers-replace'\D+','+0')|iex) / $Amount)
write-host ("Keskiarvo :" , $Average)