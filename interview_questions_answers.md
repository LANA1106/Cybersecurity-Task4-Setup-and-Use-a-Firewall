# Interview Questions and Answers - Firewall Task

## Task 4: Windows Firewall Management

### Interview Questions:

## 1. What is a firewall?
A firewall is a network security device or software that monitors and controls incoming and outgoing network traffic based on predetermined security rules. It acts as a barrier between trusted internal networks and untrusted external networks (like the Internet). The firewall examines data packets and decides whether to allow or block them based on configured rules, helping protect systems from unauthorized access, malware, and other security threats.

## 2. Difference between stateful and stateless firewall?
**Stateless Firewall:**
- Examines each packet independently without considering the connection state
- Makes decisions based only on packet headers (source/destination IP, ports, protocol)
- Faster processing but less secure
- Cannot track connection context
- Example: Basic packet filtering

**Stateful Firewall:**
- Tracks the state of network connections and remembers previous packets
- Maintains a connection table to track established sessions
- Can allow return traffic for established connections automatically
- More secure as it understands connection context
- Slightly slower due to state tracking overhead
- Example: Windows Firewall, most modern firewalls

## 3. What are inbound and outbound rules?
**Inbound Rules:**
- Control traffic coming INTO your system from external sources
- Block unauthorized access attempts from the internet or network
- Example: Blocking incoming Telnet connections on port 23
- Default Windows policy: Block inbound connections

**Outbound Rules:**
- Control traffic going OUT from your system to external destinations
- Can prevent malware from communicating with command & control servers
- Can restrict which applications can access the internet
- Example: Allowing web browser to access HTTP/HTTPS ports
- Default Windows policy: Allow outbound connections

## 4. How does UFW simplify firewall management?
UFW (Uncomplicated Firewall) is a Linux tool that simplifies iptables management:
- **Simple syntax:** Uses plain English commands like `ufw allow 22`
- **Default policies:** Easy to set with `ufw default deny incoming`
- **Application profiles:** Pre-configured rules for common services
- **Logging:** Simple logging configuration with `ufw logging on`
- **Status display:** Clear status with `ufw status verbose`
- **Beginner-friendly:** Reduces complexity of raw iptables commands

*Note: Windows equivalent would be PowerShell cmdlets like `New-NetFirewallRule` which simplify Windows Firewall management compared to netsh commands.*

## 5. Why block port 23 (Telnet)?
**Security Risks of Telnet:**
- **Unencrypted:** All data including passwords transmitted in plain text
- **Easy interception:** Network sniffing can capture credentials
- **No authentication security:** Basic password authentication only
- **Legacy protocol:** Outdated with better alternatives available
- **Common attack vector:** Frequently targeted by malware and attackers

**Better Alternatives:**
- SSH (port 22) for command-line access - encrypted
- RDP (port 3389) for Windows remote desktop - encrypted
- HTTPS (port 443) for web-based management - encrypted

## 6. What are common firewall mistakes?
1. **Disabling firewall completely** - Leaves system vulnerable to attacks
2. **Overly permissive rules** - Using "allow all" instead of specific rules
3. **Not testing rules** - Failing to verify rules work as intended
4. **Poor documentation** - Not documenting custom rules for maintenance
5. **Default passwords** - Using default credentials for firewall management
6. **Ignoring logs** - Not monitoring firewall logs for threats
7. **No regular updates** - Not updating rules for new applications/threats
8. **Opening unnecessary ports** - Creating attack surface without business need
9. **Not considering internal threats** - Only focusing on external threats
10. **Inconsistent policies** - Different rules across similar systems

## 7. How does a firewall improve network security?
**Network Protection:**
- **Access Control:** Blocks unauthorized connection attempts
- **Traffic Filtering:** Inspects and filters network packets based on rules
- **Threat Prevention:** Stops malware from communicating with external servers
- **Service Protection:** Limits exposure of network services to specific ports/IPs

**Security Benefits:**
- **Defense in Depth:** Adds a layer to overall security strategy
- **Compliance:** Helps meet regulatory security requirements
- **Network Segmentation:** Can isolate different network zones
- **Audit Trail:** Provides logging for security analysis
- **Prevention of Data Exfiltration:** Controls outbound traffic to prevent data theft

## 8. What is NAT in firewalls?
**NAT (Network Address Translation):**
- **Purpose:** Translates private IP addresses to public IP addresses
- **Security benefit:** Hides internal network structure from external networks
- **Port mapping:** Maps internal IP:port combinations to external IP:port
- **Stateful tracking:** Maintains connection state for return traffic

**Types of NAT:**
- **Static NAT:** One-to-one mapping between private and public IPs
- **Dynamic NAT:** Pool of public IPs assigned dynamically
- **PAT (Port Address Translation):** Many private IPs share one public IP using different ports

**Security Advantages:**
- **Network hiding:** Internal network topology not visible externally
- **Implicit firewall:** Only established connections can return traffic
- **Reduced attack surface:** External attackers cannot directly access internal IPs

---

## Practical Demonstration Results:
- ✅ Windows Firewall enabled on all profiles (Domain, Private, Public)
- ✅ Default policy: Block inbound, Allow outbound
- ✅ Port 23 (Telnet) confirmed blocked through connectivity testing
- ✅ Demonstrated firewall rule management commands
- ✅ Documented security best practices and common mistakes

**Tools Used:**
- Windows Defender Firewall
- PowerShell (Get-NetFirewallProfile, Test-NetConnection)
- Command Line (netsh advfirewall commands)
