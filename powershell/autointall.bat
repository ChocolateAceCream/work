@echo offs
	echo %1
 

echo Please Insert the computer name (e.g. \\chh001):

set /p Computer=

 

echo Please Insert your Domain Admin Account username (e.g. chh\jsmith):

set /p Username=

 

echo Please Insert your Domain Admin Account Password:

set /p Password=

 

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c mkdir c:\install

:: SAGITTA install Download

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhws1\Installs\AMS Sagitta Workstation\82100\SagittaDLL.msi"  c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhws1\Installs\AMS Sagitta Workstation\82100\AMSSagittaActiveXControls.msi" c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhws1\Installs\AMS Sagitta Workstation\82100\AMSVBRuntime.msi" c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhws1\Installs\AMS Sagitta Workstation\82100\AMSWordClientInstall.msi" c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhws1\Installs\AMS Sagitta Workstation\82100\ImportIt.msi" c:\install

 

:: ImageRight install Download

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhira\ImageWrt\install5\installs\IRDesktop.msi" c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhira\ImageWrt\install5\installs\IRDocCap.msi" c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhira\ImageWrt\install5\installs\IRMicrosoftAddin.msi" c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhira\ImageWrt\install5\installs\IRDocumentConverter.msi" c:\install

 

:: Download imagewrt update script

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhins.com\dfs\Installs\installer_script\20151111-imagewrt-update.bat"  c:\install

 

:: SAGITTA install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\AMSSagittaActiveXControls.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\AMSVBRuntime.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\AMSWordClientInstall.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\SagittaDLL.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\ImportIt.msi" /passive /quiet /norestart ALLUSERS=True

 

:: ImageRight install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\IRDesktop.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\IRDocCap.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\IRMicrosoftAddin.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\IRDocumentConverter.msi" /passive /quiet /norestart ALLUSERS=True

 

 

:: Install Office 2010

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c "\\chhws1\Installs\MSO2K10ST\setup.exe" /config \\chhws1\Installs\MSO2K10ST\Standard.WW\config.xml

 

:: Install McAffee Agent

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c "\\chhws1\Installs\McAfee 4.6.0 Package Install\FramePkg.exe" /INSTALL=AGENT /SILENT

 

:: Patch ImageWrt

c:\install\20151111-imagewrt-update.bat /passive /quiet /norestart ALLUSERS=True

 

:: IE 9 Install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c "\\chhws1\installs\internet explorer 9 win 7 32 bit\IE9-Windows7-x86-enu-final.exe" /quiet /passive /norestart ALLUSERS=True

 

echo Script Finished Running:



