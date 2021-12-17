$Name = Read-Host "Minkä niminen kansio luodaan?"
New-Item -Path . -Name $Name -ItemType "directory"