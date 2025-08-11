# Advanced Network Troubleshooting Tool

## Overview
A comprehensive GUI-based network troubleshooting tool designed for Windows systems. This tool provides an intuitive interface for performing various network diagnostic and repair operations.

## Developer Information
- **Designed for:** Cybersertex
- **Developed by:** Sumit Ghosh
- **Contact:** cybersertex@outlook.com
- **Phone:** 7076501101
- **Version:** 2.0

## Features

### Basic Network Tests
- **Ping Test** - Test connectivity to remote hosts
- **Trace Route** - Trace the path packets take to a destination
- **DNS Lookup** - Resolve domain names to IP addresses
- **Port Scanner** - Test connectivity to specific ports
- **Connection Test** - Detailed network connection analysis

### Network Configuration Tools
- **IP Configuration** - View detailed IP settings
- **Network Statistics** - Display active connections and ports
- **Route Table** - View system routing table
- **ARP Table** - Display Address Resolution Protocol table
- **WiFi Profiles** - List saved wireless network profiles

### Network Repair Tools
- **Flush DNS** - Clear DNS resolver cache
- **Renew IP** - Release and renew IP address
- **Reset Winsock** - Reset Windows Sockets catalog
- **Reset TCP/IP** - Reset TCP/IP stack
- **Full Reset** - Complete network stack reset

### Advanced Diagnostic Tools
- **Firewall Status** - Check Windows Firewall configuration
- **Network Services** - View network-related service status
- **Network Adapters** - Display network adapter information
- **Bandwidth Monitor** - Monitor network interface usage
- **System Information** - Display system configuration details

## System Requirements
- Windows 7/8/10/11
- PowerShell 3.0 or higher
- Administrative privileges (for some operations)
- .NET Framework 3.5 or higher

## Installation
1. Download both files:
   - `NetworkTroubleshootTool.bat`
   - `NetworkTroubleshootTool.ps1`
2. Place both files in the same directory
3. Double-click `NetworkTroubleshootTool.bat` to launch

## Usage Instructions
1. **Launch the Tool:** Run `NetworkTroubleshootTool.bat`
2. **Select Operation:** Click any button to run the corresponding diagnostic tool
3. **View Results:** Results appear in a separate window with detailed output
4. **Administrator Privileges:** Some operations may prompt for elevated permissions
5. **Warning Dialogs:** Potentially disruptive operations will show confirmation dialogs

## Tool Categories

### Row 1: Basic Network Tests
| Tool | Description | Input Required |
|------|-------------|----------------|
| Ping Test | Tests connectivity to a host | IP address or hostname |
| Trace Route | Shows path to destination | IP address or hostname |
| DNS Lookup | Resolves domain names | Domain name |
| Port Scanner | Tests specific port connectivity | IP:Port format |
| Connection Test | Detailed connectivity analysis | None (uses 8.8.8.8) |

### Row 2: Network Configuration
| Tool | Description | Admin Required |
|------|-------------|----------------|
| IP Config | Shows network configuration | No |
| Network Stats | Lists active connections | No |
| Route Table | Displays routing information | No |
| ARP Table | Shows MAC address mappings | No |
| WiFi Profiles | Lists saved WiFi networks | No |

### Row 3: Network Repair Tools
| Tool | Description | Admin Required | Restart Required |
|------|-------------|----------------|------------------|
| Flush DNS | Clears DNS cache | No | No |
| Renew IP | Renews DHCP lease | Yes | No |
| Reset Winsock | Resets socket catalog | Yes | Maybe |
| Reset TCP/IP | Resets IP stack | Yes | Maybe |
| Full Reset | Complete network reset | Yes | Yes |

### Row 4: Advanced Tools
| Tool | Description | Admin Required |
|------|-------------|----------------|
| Firewall Status | Shows firewall configuration | No |
| Network Services | Lists network service status | No |
| Network Adapters | Shows adapter information | No |
| Bandwidth Monitor | Monitors network usage | No |
| System Info | Displays system details | No |

## Security Considerations
- Some operations require administrative privileges
- Network reset operations may temporarily disrupt connectivity
- Use "Full Reset" only as a last resort
- Always ensure you have alternative connectivity before performing resets

## Troubleshooting
- **PowerShell not found:** Install PowerShell or update to a newer version
- **Access denied errors:** Run as Administrator
- **Script execution disabled:** The tool automatically sets execution policy
- **GUI doesn't appear:** Check Windows Forms are installed (.NET Framework)

## Support
For technical support or feature requests:
- **Email:** cybersertex@outlook.com
- **Phone:** 7076501101

## License
This tool is designed for Cybersertex. All rights reserved.

## Version History
- **v2.0** - Advanced GUI with comprehensive network diagnostic tools
- **v1.0** - Basic network troubleshooting functionality

## Safety Notice
⚠️ **WARNING:** Network reset operations can temporarily disrupt network connectivity. Use with caution, especially in production environments.

## File Structure
```
NetworkTroubleshootingTool/
├── NetworkTroubleshootTool.bat    # Launcher batch file
├── NetworkTroubleshootTool.ps1    # Main PowerShell GUI script
└── README.md                      # This documentation
```
