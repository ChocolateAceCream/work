:: ImageRight install Download

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhira\ImageWrt\install5\installs\IRDesktop.msi" c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhira\ImageWrt\install5\installs\IRDocCap.msi" c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhira\ImageWrt\install5\installs\IRMicrosoftAddin.msi" c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhira\ImageWrt\install5\installs\IRDocumentConverter.msi" c:\install

 

:: Download imagewrt update script

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhins.com\dfs\Installs\installer_script\20151111-imagewrt-update.bat"  c:\install

 :: ImageRight install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\IRDesktop.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\IRDocCap.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\IRMicrosoftAddin.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\IRDocumentConverter.msi" /passive /quiet /norestart ALLUSERS=True

:: Patch ImageWrt

c:\install\20151111-imagewrt-update.bat /passive /quiet /norestart ALLUSERS=True

 