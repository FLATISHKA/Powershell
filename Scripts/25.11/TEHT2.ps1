$lines = Get-Content "./Tehtäväkansio 2/names2.txt"
$i = 0
foreach ($line in $lines)
{
    $line = $lines -split ','
    $PASS = ConvertTo-SecureString $line[2+ $i] -AsPlainText -Force
    $Username = ($line[0 + $i]+'.'+$line[1+ $i])
    $Fullname = ($line[0+ $i]+' '+$line[1+ $i])
    $op = Get-LocalUser | Where-Object {$_.Name -eq $Username}
    if( -not $op){
        $Username
        New-LocalUser -name $Username -Password $PASS -FullName $Fullname 
    }
    $i += 3
}
