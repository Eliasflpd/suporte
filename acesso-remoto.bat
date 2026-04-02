@echo off
title Suporte Tecnico - Elias
echo Preparando suporte remoto, aguarde...

:: Baixar AnyDesk portavel (sem instalacao, sem wizard)
powershell -Command "Invoke-WebRequest -Uri 'https://download.anydesk.com/AnyDesk.exe' -OutFile '%TEMP%\AnyDesk.exe'" >nul 2>&1

:: Iniciar AnyDesk em modo portavel (pula toda configuracao inicial)
start "" "%TEMP%\AnyDesk.exe" --portable --tray

:: Aguardar iniciar
timeout /t 6 /nobreak >nul

:: Pegar ID
for /f "tokens=*" %%i in ('powershell -Command "& \"%TEMP%\AnyDesk.exe\" --get-id 2>$null"') do set ANYDESK_ID=%%i

:: Enviar ID pro celular do Elias
powershell -Command "Invoke-RestMethod -Uri 'https://ntfy.sh/tecnico-elias' -Method POST -Body 'ID: %ANYDESK_ID%' -Headers @{Title='Cliente aguardando!'; Priority='urgent'; Tags='computer,sos'}" >nul 2>&1

:: Mostrar janela simples pro cliente
powershell -Command ^
  "Add-Type -AssemblyName System.Windows.Forms; ^
   [System.Windows.Forms.MessageBox]::Show( ^
   'Tudo pronto! O Tecnico Elias ja foi avisado e vai conectar em instantes.`n`nNao feche essa janela azul do AnyDesk!', ^
   'Suporte Tecnico - Elias', ^
   [System.Windows.Forms.MessageBoxButtons]::OK, ^
   [System.Windows.Forms.MessageBoxIcon]::Information)"
