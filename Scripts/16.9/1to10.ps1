Write-Host "For loop 10-1"
for($i=10; $i -gt 1; $i--){
    write-host $i
}

write-host "While 1-10"
while($i -lt 11){
    write-host $i
    $i++
}

write-host "While 10-1"
$i=10
while($i -gt 0){
    write-host $i
    $i--
}

write-host "Do while 1-10"
$i = 1
Do
{
    write-host $i
    $i++
} While ($i -lt 11)

write-host "Do while 10-1"
$i= 10
Do
{
    write-host $i
    $i--
} While ($i -gt 0)

write-host "Do until 10-1"
$i= 1
Do
{
    write-host $i
    $i++
} Until ($i -gt 10)