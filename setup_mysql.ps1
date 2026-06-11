Write-Host "Initializing MySQL data directory..."
& "C:\Program Files\MySQL\MySQL Server 8.4\bin\mysqld.exe" --initialize-insecure --user=mysql
if ($LASTEXITCODE -ne 0) { Write-Host "Init failed!"; exit 1 }

Write-Host "Installing MySQL service..."
& "C:\Program Files\MySQL\MySQL Server 8.4\bin\mysqld.exe" --install MySQL
if ($LASTEXITCODE -ne 0) { Write-Host "Install service failed!"; exit 1 }

Write-Host "Starting MySQL service..."
Start-Service -Name MySQL
if ($?) { Write-Host "MySQL started successfully!" } else { Write-Host "Start failed!"; exit 1 }
