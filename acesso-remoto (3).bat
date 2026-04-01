@echo off
set PS=%TEMP%\suporte_elias.ps1

(
echo Add-Type -AssemblyName System.Windows.Forms
echo Add-Type -AssemblyName System.Drawing
echo.
echo # Formulario principal
echo $form = New-Object System.Windows.Forms.Form
echo $form.Text = 'Suporte Tecnico - Elias'
echo $form.Size = New-Object System.Drawing.Size^(500, 360^)
echo $form.StartPosition = 'CenterScreen'
echo $form.BackColor = [System.Drawing.Color]::FromArgb^(18, 18, 35^)
echo $form.FormBorderStyle = 'FixedDialog'
echo $form.MaximizeBox = $false
echo $form.MinimizeBox = $false
echo.
echo # Painel superior colorido
echo $painelTopo = New-Object System.Windows.Forms.Panel
echo $painelTopo.Size = New-Object System.Drawing.Size^(500, 6^)
echo $painelTopo.Location = New-Object System.Drawing.Point^(0, 0^)
echo $painelTopo.BackColor = [System.Drawing.Color]::FromArgb^(0, 180, 255^)
echo.
echo # Icone escudo
echo $lblIcone = New-Object System.Windows.Forms.Label
echo $lblIcone.Text = '🛡'
echo $lblIcone.Font = New-Object System.Drawing.Font^('Segoe UI Emoji', 36^)
echo $lblIcone.AutoSize = $true
echo $lblIcone.Location = New-Object System.Drawing.Point^(40, 35^)
echo $lblIcone.BackColor = [System.Drawing.Color]::Transparent
echo.
echo # Titulo
echo $lblTitulo = New-Object System.Windows.Forms.Label
echo $lblTitulo.Text = 'Suporte Tecnico'
echo $lblTitulo.Font = New-Object System.Drawing.Font^('Segoe UI', 20, [System.Drawing.FontStyle]::Bold^)
echo $lblTitulo.ForeColor = [System.Drawing.Color]::White
echo $lblTitulo.AutoSize = $true
echo $lblTitulo.Location = New-Object System.Drawing.Point^(115, 35^)
echo $lblTitulo.BackColor = [System.Drawing.Color]::Transparent
echo.
echo # Subtitulo
echo $lblSub = New-Object System.Windows.Forms.Label
echo $lblSub.Text = 'por Elias • Assistencia Remota'
echo $lblSub.Font = New-Object System.Drawing.Font^('Segoe UI', 9^)
echo $lblSub.ForeColor = [System.Drawing.Color]::FromArgb^(0, 180, 255^)
echo $lblSub.AutoSize = $true
echo $lblSub.Location = New-Object System.Drawing.Point^(118, 72^)
echo $lblSub.BackColor = [System.Drawing.Color]::Transparent
echo.
echo # Linha separadora
echo $linha = New-Object System.Windows.Forms.Panel
echo $linha.Size = New-Object System.Drawing.Size^(420, 1^)
echo $linha.Location = New-Object System.Drawing.Point^(40, 110^)
echo $linha.BackColor = [System.Drawing.Color]::FromArgb^(50, 50, 80^)
echo.
echo # Mensagem principal
echo $lblMsg = New-Object System.Windows.Forms.Label
echo $lblMsg.Text = "Ola! Estamos preparando uma conexao segura`r`ncom o Tecnico Elias para te ajudar."
echo $lblMsg.Font = New-Object System.Drawing.Font^('Segoe UI', 11^)
echo $lblMsg.ForeColor = [System.Drawing.Color]::FromArgb^(200, 215, 255^)
echo $lblMsg.AutoSize = $true
echo $lblMsg.Location = New-Object System.Drawing.Point^(40, 125^)
echo $lblMsg.BackColor = [System.Drawing.Color]::Transparent
echo.
echo # Badge seguro
echo $lblBadge = New-Object System.Windows.Forms.Label
echo $lblBadge.Text = '  ✔  Conexao 100%% Segura e Autorizada  '
echo $lblBadge.Font = New-Object System.Drawing.Font^('Segoe UI', 9, [System.Drawing.FontStyle]::Bold^)
echo $lblBadge.ForeColor = [System.Drawing.Color]::FromArgb^(18, 18, 35^)
echo $lblBadge.BackColor = [System.Drawing.Color]::FromArgb^(0, 210, 130^)
echo $lblBadge.AutoSize = $true
echo $lblBadge.Location = New-Object System.Drawing.Point^(40, 180^)
echo $lblBadge.Padding = New-Object System.Windows.Forms.Padding^(5, 3, 5, 3^)
echo.
echo # Status animado
echo $lblStatus = New-Object System.Windows.Forms.Label
echo $lblStatus.Text = 'Iniciando...'
echo $lblStatus.Font = New-Object System.Drawing.Font^('Segoe UI', 9^)
echo $lblStatus.ForeColor = [System.Drawing.Color]::FromArgb^(150, 160, 200^)
echo $lblStatus.AutoSize = $true
echo $lblStatus.Location = New-Object System.Drawing.Point^(40, 225^)
echo $lblStatus.BackColor = [System.Drawing.Color]::Transparent
echo.
echo # Barra de progresso
echo $progress = New-Object System.Windows.Forms.ProgressBar
echo $progress.Location = New-Object System.Drawing.Point^(40, 248^)
echo $progress.Size = New-Object System.Drawing.Size^(415, 14^)
echo $progress.Style = 'Marquee'
echo $progress.MarqueeAnimationSpeed = 25
echo.
echo # Rodape
echo $lblRodape = New-Object System.Windows.Forms.Label
echo $lblRodape.Text = '⚠  Nao feche essa janela — o tecnico ja ja conecta!'
echo $lblRodape.Font = New-Object System.Drawing.Font^('Segoe UI', 9, [System.Drawing.FontStyle]::Italic^)
echo $lblRodape.ForeColor = [System.Drawing.Color]::FromArgb^(255, 190, 60^)
echo $lblRodape.AutoSize = $true
echo $lblRodape.Location = New-Object System.Drawing.Point^(40, 295^)
echo $lblRodape.BackColor = [System.Drawing.Color]::Transparent
echo.
echo $form.Controls.AddRange^(@^($painelTopo,$lblIcone,$lblTitulo,$lblSub,$linha,$lblMsg,$lblBadge,$lblStatus,$progress,$lblRodape^)^)
echo $form.Show^(^)
echo $form.Refresh^(^)
echo.
echo # Animacao de pontos no status
echo $dots = 0
echo $timer = New-Object System.Windows.Forms.Timer
echo $timer.Interval = 500
echo $timer.Add_Tick^({
echo     $script:dots = ^($script:dots + 1^) %% 4
echo     $pontos = '.' * ^($script:dots + 1^)
echo     $lblStatus.Text = "Baixando ferramenta de acesso$pontos"
echo     $form.Refresh^(^)
echo }^)
echo $timer.Start^(^)
echo.
echo # Download AnyDesk com progresso real
echo $destino = $env:TEMP + '\AnyDesk.exe'
echo $wc = New-Object System.Net.WebClient
echo $wc.DownloadFile^('https://download.anydesk.com/AnyDesk.exe', $destino^)
echo.
echo $timer.Stop^(^)
echo $lblStatus.Text = 'Abrindo conexao segura...'
echo $progress.Style = 'Marquee'
echo $progress.MarqueeAnimationSpeed = 40
echo $form.Refresh^(^)
echo.
echo Start-Process $destino
echo Start-Sleep -Seconds 6
echo.
echo $lblStatus.Text = 'Coletando dados da sessao...'
echo $form.Refresh^(^)
echo $id = ^& $destino --get-id 2^>$null
echo.
echo $lblStatus.Text = 'Avisando o tecnico Elias...'
echo $form.Refresh^(^)
echo Invoke-RestMethod -Uri 'https://ntfy.sh/tecnico-elias' -Method POST -Body ^('ID AnyDesk: ' + $id^) -Headers @{Title='Cliente aguardando conexao!'; Priority='urgent'; Tags='computer,technologist'}
echo.
echo $lblStatus.Text = '✔  Tecnico avisado! Aguardando conexao...'
echo $lblStatus.ForeColor = [System.Drawing.Color]::FromArgb^(0, 210, 130^)
echo $progress.Style = 'Continuous'
echo $progress.Value = 100
echo $form.Refresh^(^)
echo.
echo [System.Windows.Forms.Application]::Run^($form^)
) > "%PS%"

powershell -ExecutionPolicy Bypass -WindowStyle Hidden -File "%PS%"
