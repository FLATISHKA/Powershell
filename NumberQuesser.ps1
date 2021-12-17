[int]$a = 0
[int]$b = 128
[int]$t = 0
read-host("think about an integer number between 0 and 128")
while($t -lt 6){
    $m2 = $m
    $m = ($a + $b) /2
    $t+=1
    $ans = read-host("is $([int]$m) the correct number?")
    if($ans -eq "yes"){    
        break
    }elseif ($ans -eq "no"){
        $ans2 = read-host("is $([int]$m) larger than correct number?")
        if($ans2 -eq "yes"){
            $b = $m
        }else{ 
            $a = $m
            $b = $m / 2 + $m
        }
    }
}
if($ans -eq "yes"){
    write-host("The number you thought of is $m and I guessed it $t tries.")
}else{
    write-host("I am sorry that I cannot guess it after 6 attempts.")
}