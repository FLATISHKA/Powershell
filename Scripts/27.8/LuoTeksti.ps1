$Name = Read-Host "Minkä niminen kansio luodaan?"
$Name = $Name + ".txt"
$Value = Read-Host "mitä tekstiä tekstitiedostoon kirjoitetaan?"
New-Item -Path . -Name $Name -ItemType "file" -Value $Value