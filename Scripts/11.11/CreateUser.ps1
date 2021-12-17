$Username = read-host("Username")
$Fullname = read-host("Fullname")
$Description = Read-Host("Description")
$Password = Read-Host("Password") -AsSecureString
$PasswordCheck = Read-Host("Confirm Password") -AsSecureString
$pwd1 = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password))
$pwd2 = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($PasswordCheck))
if ($pwd1 -ceq $pwd2) {
    write-host("Passwords matched! $pwd1")
    New-LocalUser -name $Username -Password $Password -FullName $Fullname -Description $Description
    Write-host("yey! Account Created!")
}else{
    Write-Host("Passwords dont match $pwd1, $pwd1")
}

