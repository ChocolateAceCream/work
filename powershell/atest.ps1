@echo off

$myvar = "Hello World"
function PrintHelloWorld 
{ 
  $myvar = "Hello Universe"
  Write-Host "$myvar"
} 
Write-Host "$myvar" 
PrintHelloWorld 
Write-Host "$myvar"	
