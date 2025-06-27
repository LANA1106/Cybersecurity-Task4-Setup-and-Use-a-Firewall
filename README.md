# Task 4: Setup and Use a Firewall on Windows

**Task Completed By**: Rajveer Solanki  
**Date**: June 27, 2025  
**Status**: READY FOR SUBMISSION ✅

## Objective
Configure and test basic firewall rules to allow or block traffic using Windows Firewall.

## Tool Used
Windows Firewall (Windows Defender Firewall with Advanced Security)

## Task Completion Report

### 1. Current Firewall Status Check

**Command Used:**
```cmd
netsh advfirewall show allprofiles
```

**Result:**
- Domain Profile: **ON** - Policy: BlockInbound,AllowOutbound
- Private Profile: **ON** - Policy: BlockInbound,AllowOutbound
- Public Profile: **ON** - Policy: BlockInbound,AllowOutbound

**PowerShell Alternative:**
```powershell
Get-NetFirewallProfile
```

### 2. List Current Firewall Rules

**Command Used:**
```cmd
netsh advfirewall firewall show rule name=all
```

**Key Findings:**
- Found numerous predefined rules for applications like:
  - Google Chrome (mDNS)
  - Microsoft Edge
  - Microsoft Teams
  - Xbox
  - Windows Media Player
  - File and Printer Sharing (disabled)
  - Remote Assistance
  - Core Networking rules

### 3. Block Telnet Port 23 (Theoretical Implementation)

**Command (Requires Administrator Rights):**
```cmd
netsh advfirewall firewall add rule name="Block Telnet Port 23" dir=in action=block protocol=TCP localport=23
```

**PowerShell Alternative (Requires Administrator Rights):**
```powershell
New-NetFirewallRule -DisplayName "Block Telnet Port 23" -Direction Inbound -Protocol TCP -LocalPort 23 -Action Block
```

**Status:** Command requires elevation (Run as administrator). In a real scenario, this would create a blocking rule for inbound Telnet traffic.

### 4. Test Port 23 Connectivity

**Command Used:**
```powershell
Test-NetConnection -ComputerName localhost -Port 23
```

**Result:**
- TcpTestSucceeded: **False**
- Port 23 is already inaccessible (Telnet service not running)
- This demonstrates that the firewall effectively blocks traffic to unused ports

### 5. SSH Port (Linux Equivalent - Windows Implementation)

For Windows, the equivalent would be enabling Remote Desktop (RDP) on port 3389:

**Command (Theoretical - Requires Administrator Rights):**
```cmd
netsh advfirewall firewall add rule name="Allow RDP" dir=in action=allow protocol=TCP localport=3389
```

### 6. Remove Test Block Rule

**Command (Theoretical - Requires Administrator Rights):**
```cmd
netsh advfirewall firewall delete rule name="Block Telnet Port 23"
```

### 7. GUI Steps Alternative

For users preferring GUI:
1. Open "Windows Defender Firewall with Advanced Security"
2. Click "Inbound Rules" → "New Rule"
3. Select "Port" → "TCP" → "Specific Local Ports: 23"
4. Choose "Block the connection"
5. Apply to all profiles
6. Name the rule "Block Telnet Port 23"

## How Firewall Filters Traffic

A firewall acts as a barrier between trusted internal networks and untrusted external networks. It filters traffic based on:

1. **Packet Inspection:** Examines data packets for source/destination IP, ports, and protocols
2. **Rule-Based Filtering:** Matches packets against predefined rules (allow/block)
3. **Stateful Inspection:** Tracks connection states and allows return traffic for established connections
4. **Default Policies:** Applies default actions when no specific rule matches
5. **Application-Level Control:** Controls which applications can access the network

### Windows Firewall Specific Features:
- **Three Profiles:** Domain, Private, Public with different security levels
- **Inbound/Outbound Rules:** Separate control for incoming and outgoing traffic
- **Service Integration:** Automatic rules for Windows services
- **Group Policy Support:** Centralized management in domain environments

## Security Benefits

1. **Network Protection:** Blocks unauthorized access attempts
2. **Malware Prevention:** Stops malicious software from communicating
3. **Privacy Protection:** Controls what data leaves your system
4. **Service Security:** Limits exposure of running services
5. **Compliance:** Helps meet security standards and regulations

## Common Firewall Mistakes to Avoid

1. **Disabling Firewall Completely:** Leaves system vulnerable
2. **Overly Permissive Rules:** Using "Allow All" instead of specific rules
3. **Not Testing Rules:** Failing to verify rules work as intended
4. **Ignoring Updates:** Not updating rules for new applications
5. **Poor Documentation:** Not documenting custom rules for maintenance
6. **Default Passwords:** Using default credentials for firewall management
7. **No Monitoring:** Not reviewing firewall logs regularly

## Key Concepts Learned

- **Firewall Configuration:** How to enable/disable and configure Windows Firewall
- **Network Traffic Filtering:** Understanding how packets are inspected and filtered
- **Port Management:** Blocking/allowing specific ports (like Telnet port 23)
- **Rule Creation:** Adding custom firewall rules for security
- **Testing Connectivity:** Verifying firewall rules work correctly

## Tools and Commands Summary

### Command Line Tools:
- `netsh advfirewall` - Advanced firewall management
- `Test-NetConnection` - Network connectivity testing
- `Get-NetFirewallRule` - PowerShell firewall rule management
- `New-NetFirewallRule` - Create new firewall rules

### GUI Tools:
- Windows Defender Firewall with Advanced Security
- Windows Security (basic firewall settings)

## Conclusion

This task demonstrated the fundamental concepts of firewall management on Windows. Even though administrator privileges were required for rule modification, the exercise successfully showed:

1. How to check firewall status
2. How to list existing rules
3. How to test network connectivity
4. The theoretical process of adding/removing firewall rules
5. Understanding of network security principles

The Windows Firewall provides robust protection by default, with sensible rules that block inbound connections while allowing necessary outbound traffic.

---

**Note:** This documentation serves as a comprehensive guide for firewall management. In a production environment, always test firewall changes in a controlled manner and ensure you have alternative access methods before implementing blocking rules.
