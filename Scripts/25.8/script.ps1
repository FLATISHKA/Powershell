#$wshell = New-Object -ComObject Wscript.Shell -ErrorAction Stop
#$wshell.Popup("Hello world!",0,"Hey!",48+4)

Write-Host "Hello World!"
Write-Host -NoNewline "Press any key"
$nohomo = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown');
