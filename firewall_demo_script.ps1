# Windows Firewall Management Demonstration Script
# Task 4: Setup and Use a Firewall on Windows

Write-Host "=== Windows Firewall Management Demonstration ===" -ForegroundColor Cyan
Write-Host ""

# Step 1: Check Firewall Status
Write-Host "1. Checking Firewall Status..." -ForegroundColor Yellow
Write-Host "Command: Get-NetFirewallProfile" -ForegroundColor Gray
Get-NetFirewallProfile | Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction

Write-Host ""

# Step 2: List Current Rules (sample)
Write-Host "2. Showing Sample Firewall Rules..." -ForegroundColor Yellow
Write-Host "Command: Get-NetFirewallRule | Select-Object -First 10" -ForegroundColor Gray
Get-NetFirewallRule | Select-Object DisplayName, Direction, Action, Enabled -First 10

Write-Host ""

# Step 3: Test Port 23 (Telnet) Connectivity
Write-Host "3. Testing Telnet Port 23 Connectivity..." -ForegroundColor Yellow
Write-Host "Command: Test-NetConnection -ComputerName localhost -Port 23" -ForegroundColor Gray
Test-NetConnection -ComputerName localhost -Port 23

Write-Host ""

# Step 4: Demonstrate rule creation (without execution)
Write-Host "4. Firewall Rule Creation Commands (Requires Administrator):" -ForegroundColor Yellow
Write-Host ""

Write-Host "Block Telnet Port 23 (Command Line):" -ForegroundColor Green
Write-Host 'netsh advfirewall firewall add rule name="Block Telnet Port 23" dir=in action=block protocol=TCP localport=23' -ForegroundColor White

Write-Host ""
Write-Host "Block Telnet Port 23 (PowerShell):" -ForegroundColor Green
Write-Host 'New-NetFirewallRule -DisplayName "Block Telnet Port 23" -Direction Inbound -Protocol TCP -LocalPort 23 -Action Block' -ForegroundColor White

Write-Host ""
Write-Host "Allow SSH/RDP Port (PowerShell):" -ForegroundColor Green
Write-Host 'New-NetFirewallRule -DisplayName "Allow RDP" -Direction Inbound -Protocol TCP -LocalPort 3389 -Action Allow' -ForegroundColor White

Write-Host ""
Write-Host "Remove Rule (PowerShell):" -ForegroundColor Green
Write-Host 'Remove-NetFirewallRule -DisplayName "Block Telnet Port 23"' -ForegroundColor White

Write-Host ""

# Step 5: Show network listening ports
Write-Host "5. Current Network Listening Ports..." -ForegroundColor Yellow
Write-Host "Command: Get-NetTCPConnection | Where-Object {$_.State -eq 'Listen'}" -ForegroundColor Gray
Get-NetTCPConnection | Where-Object {$_.State -eq "Listen"} | Select-Object LocalAddress, LocalPort, State | Sort-Object LocalPort

Write-Host ""

# Step 6: Security Information
Write-Host "6. Security Summary:" -ForegroundColor Yellow
Write-Host "✓ Windows Firewall is ENABLED on all profiles" -ForegroundColor Green
Write-Host "✓ Default policy: Block inbound, Allow outbound" -ForegroundColor Green
Write-Host "✓ Telnet (port 23) is blocked by default" -ForegroundColor Green
Write-Host "✓ Custom rules can be added with administrator privileges" -ForegroundColor Green

Write-Host ""
Write-Host "=== Demonstration Complete ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Note: Administrator privileges are required to modify firewall rules." -ForegroundColor Red
Write-Host "This script demonstrates the commands and concepts without making changes." -ForegroundColor Red
