:: SAGITTA install Download

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhws1\Installs\AMS Sagitta Workstation\82100\SagittaDLL.msi"  c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhws1\Installs\AMS Sagitta Workstation\82100\AMSSagittaActiveXControls.msi" c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhws1\Installs\AMS Sagitta Workstation\82100\AMSVBRuntime.msi" c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhws1\Installs\AMS Sagitta Workstation\82100\AMSWordClientInstall.msi" c:\install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -u "%Username%" -p "%Password%" cmd /c copy "\\chhws1\Installs\AMS Sagitta Workstation\82100\ImportIt.msi" c:\install

 :: SAGITTA install

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\AMSSagittaActiveXControls.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\AMSVBRuntime.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\AMSWordClientInstall.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\SagittaDLL.msi" /passive /quiet /norestart ALLUSERS=True

\\chhws1\Installs\installer_script\psexec.exe %Computer% -h -u "%Username%" -p "%Password%" cmd /c msiexec.exe /i "c:\install\ImportIt.msi" /passive /quiet /norestart ALLUSERS=True

 