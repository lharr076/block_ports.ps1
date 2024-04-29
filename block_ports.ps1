# Array of port numbers to block
$ports = @()

# Loop through each port and create a firewall rule to block it
foreach ($port in $ports) {
    New-NetFirewallRule -DisplayName "Block Port $port (TCP)" -Direction Inbound -LocalPort $port -Protocol TCP -Action Block
    New-NetFirewallRule -DisplayName "Block Port $port (UDP)" -Direction Inbound -LocalPort $port -Protocol UDP -Action Block
    New-NetFirewallRule -DisplayName "Block Port $port (TCP)" -Direction Outbound -LocalPort $port -Protocol TCP -Action Block
    New-NetFirewallRule -DisplayName "Block Port $port (UDP)" -Direction Outbound -LocalPort $port -Protocol UDP -Action Block
}

# Display all firewall rules
Get-NetFirewallRule | Format-Table -AutoSize
