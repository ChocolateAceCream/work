function ActivateWindows {
$ActPath= C:\Temp\activate.bat
$ActivationPath= "C:\Temp\activate.bat"
#check if file exist
$FileExists =Test-Path $ActivationPath
#If file exist, activate, else print error
If ($FileExists -eq $true) {$ActPath} else {Write-Host -ForegroundColor Red "errormsg"}
}