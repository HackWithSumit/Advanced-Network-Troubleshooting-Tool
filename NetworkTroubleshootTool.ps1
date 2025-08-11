# =====================================================================
# Advanced Network Troubleshooting Tool - GUI Version
# Designed for: Cybersertex
# Developed by: Sumit Ghosh
# Contact: cybersertex@outlook.com
# Phone: 7076501101
# =====================================================================

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName Microsoft.VisualBasic

# Main Form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Advanced Network Troubleshooting Tool - Cybersertex"
$form.Size = New-Object System.Drawing.Size(800, 700)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(240, 240, 240)
$form.Icon = [System.Drawing.SystemIcons]::Information

# Header Panel
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.Size = New-Object System.Drawing.Size(800, 80)
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(25, 25, 112)
$form.Controls.Add($headerPanel)

# Title Label
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Location = New-Object System.Drawing.Point(20, 10)
$titleLabel.Size = New-Object System.Drawing.Size(600, 25)
$titleLabel.Text = "Advanced Network Troubleshooting Tool"
$titleLabel.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::White
$titleLabel.BackColor = [System.Drawing.Color]::Transparent
$headerPanel.Controls.Add($titleLabel)

# Company Info Label
$companyLabel = New-Object System.Windows.Forms.Label
$companyLabel.Location = New-Object System.Drawing.Point(20, 35)
$companyLabel.Size = New-Object System.Drawing.Size(400, 20)
$companyLabel.Text = "Designed for Cybersertex | Developed by Sumit Ghosh"
$companyLabel.Font = New-Object System.Drawing.Font("Arial", 10)
$companyLabel.ForeColor = [System.Drawing.Color]::LightGray
$companyLabel.BackColor = [System.Drawing.Color]::Transparent
$headerPanel.Controls.Add($companyLabel)

# Contact Info Label
$contactLabel = New-Object System.Windows.Forms.Label
$contactLabel.Location = New-Object System.Drawing.Point(20, 55)
$contactLabel.Size = New-Object System.Drawing.Size(500, 20)
$contactLabel.Text = "Contact: cybersertex@outlook.com | Phone: 7076501101"
$contactLabel.Font = New-Object System.Drawing.Font("Arial", 9)
$contactLabel.ForeColor = [System.Drawing.Color]::LightBlue
$contactLabel.BackColor = [System.Drawing.Color]::Transparent
$headerPanel.Controls.Add($contactLabel)

# Functions for network operations
function Show-Results {
    param($Command, $Title)
    $outputForm = New-Object System.Windows.Forms.Form
    $outputForm.Text = $Title
    $outputForm.Size = New-Object System.Drawing.Size(800, 600)
    $outputForm.StartPosition = "CenterScreen"
    
    $textBox = New-Object System.Windows.Forms.RichTextBox
    $textBox.Location = New-Object System.Drawing.Point(10, 10)
    $textBox.Size = New-Object System.Drawing.Size(760, 500)
    $textBox.Font = New-Object System.Drawing.Font("Consolas", 10)
    $textBox.ReadOnly = $true
    $textBox.BackColor = [System.Drawing.Color]::Black
    $textBox.ForeColor = [System.Drawing.Color]::Lime
    
    $closeButton = New-Object System.Windows.Forms.Button
    $closeButton.Location = New-Object System.Drawing.Point(350, 520)
    $closeButton.Size = New-Object System.Drawing.Size(100, 30)
    $closeButton.Text = "Close"
    $closeButton.Add_Click({$outputForm.Close()})
    
    $outputForm.Controls.AddRange(@($textBox, $closeButton))
    
    # Execute command and show results
    try {
        $textBox.Text = "Executing: $Command`r`n" + "="*50 + "`r`n"
        $result = Invoke-Expression $Command 2>&1
        $textBox.Text += $result | Out-String
    } catch {
        $textBox.Text += "Error: $($_.Exception.Message)"
    }
    
    $outputForm.ShowDialog()
}

# Row 1 Buttons (Basic Network Tests)
$y1 = 100

$pingButton = New-Object System.Windows.Forms.Button
$pingButton.Location = New-Object System.Drawing.Point(30, $y1)
$pingButton.Size = New-Object System.Drawing.Size(120, 50)
$pingButton.Text = "Ping Test"
$pingButton.BackColor = [System.Drawing.Color]::FromArgb(100, 149, 237)
$pingButton.ForeColor = [System.Drawing.Color]::White
$pingButton.FlatStyle = "Flat"
$pingButton.Add_Click({
    $target = [Microsoft.VisualBasic.Interaction]::InputBox("Enter IP address or hostname to ping:", "Ping Test", "8.8.8.8")
    if ($target) {
        Show-Results "ping -t $target" "Ping Test Results - $target"
    }
})
$form.Controls.Add($pingButton)

$traceButton = New-Object System.Windows.Forms.Button
$traceButton.Location = New-Object System.Drawing.Point(170, $y1)
$traceButton.Size = New-Object System.Drawing.Size(120, 50)
$traceButton.Text = "Trace Route"
$traceButton.BackColor = [System.Drawing.Color]::FromArgb(60, 179, 113)
$traceButton.ForeColor = [System.Drawing.Color]::White
$traceButton.FlatStyle = "Flat"
$traceButton.Add_Click({
    $target = [Microsoft.VisualBasic.Interaction]::InputBox("Enter IP address or hostname to trace:", "Trace Route", "google.com")
    if ($target) {
        Show-Results "tracert $target" "Trace Route Results - $target"
    }
})
$form.Controls.Add($traceButton)

$nslookupButton = New-Object System.Windows.Forms.Button
$nslookupButton.Location = New-Object System.Drawing.Point(310, $y1)
$nslookupButton.Size = New-Object System.Drawing.Size(120, 50)
$nslookupButton.Text = "DNS Lookup"
$nslookupButton.BackColor = [System.Drawing.Color]::FromArgb(255, 140, 0)
$nslookupButton.ForeColor = [System.Drawing.Color]::White
$nslookupButton.FlatStyle = "Flat"
$nslookupButton.Add_Click({
    $target = [Microsoft.VisualBasic.Interaction]::InputBox("Enter domain name for DNS lookup:", "DNS Lookup", "google.com")
    if ($target) {
        Show-Results "nslookup $target" "DNS Lookup Results - $target"
    }
})
$form.Controls.Add($nslookupButton)

$portScanButton = New-Object System.Windows.Forms.Button
$portScanButton.Location = New-Object System.Drawing.Point(450, $y1)
$portScanButton.Size = New-Object System.Drawing.Size(120, 50)
$portScanButton.Text = "Port Scanner"
$portScanButton.BackColor = [System.Drawing.Color]::FromArgb(220, 20, 60)
$portScanButton.ForeColor = [System.Drawing.Color]::White
$portScanButton.FlatStyle = "Flat"
$portScanButton.Add_Click({
    $target = [Microsoft.VisualBasic.Interaction]::InputBox("Enter IP and port (e.g., 192.168.1.1:80):", "Port Scanner", "google.com:443")
    if ($target -and $target.Contains(":")) {
        $parts = $target.Split(":")
        $ip = $parts[0]
        $port = $parts[1]
        Show-Results "Test-NetConnection -ComputerName $ip -Port $port" "Port Scan Results - $target"
    } else {
        [System.Windows.Forms.MessageBox]::Show("Please enter in format: IP:PORT", "Invalid Format")
    }
})
$form.Controls.Add($portScanButton)

$speedTestButton = New-Object System.Windows.Forms.Button
$speedTestButton.Location = New-Object System.Drawing.Point(590, $y1)
$speedTestButton.Size = New-Object System.Drawing.Size(120, 50)
$speedTestButton.Text = "Connection Test"
$speedTestButton.BackColor = [System.Drawing.Color]::FromArgb(138, 43, 226)
$speedTestButton.ForeColor = [System.Drawing.Color]::White
$speedTestButton.FlatStyle = "Flat"
$speedTestButton.Add_Click({
    Show-Results "Test-NetConnection -ComputerName 8.8.8.8 -InformationLevel Detailed" "Network Connection Test"
})
$form.Controls.Add($speedTestButton)

# Row 2 Buttons (Network Configuration)
$y2 = 170

$ipconfigButton = New-Object System.Windows.Forms.Button
$ipconfigButton.Location = New-Object System.Drawing.Point(30, $y2)
$ipconfigButton.Size = New-Object System.Drawing.Size(120, 50)
$ipconfigButton.Text = "IP Config"
$ipconfigButton.BackColor = [System.Drawing.Color]::FromArgb(70, 130, 180)
$ipconfigButton.ForeColor = [System.Drawing.Color]::White
$ipconfigButton.FlatStyle = "Flat"
$ipconfigButton.Add_Click({
    Show-Results "ipconfig /all" "IP Configuration"
})
$form.Controls.Add($ipconfigButton)

$netstatButton = New-Object System.Windows.Forms.Button
$netstatButton.Location = New-Object System.Drawing.Point(170, $y2)
$netstatButton.Size = New-Object System.Drawing.Size(120, 50)
$netstatButton.Text = "Network Stats"
$netstatButton.BackColor = [System.Drawing.Color]::FromArgb(205, 92, 92)
$netstatButton.ForeColor = [System.Drawing.Color]::White
$netstatButton.FlatStyle = "Flat"
$netstatButton.Add_Click({
    Show-Results "netstat -an" "Network Statistics"
})
$form.Controls.Add($netstatButton)

$routeButton = New-Object System.Windows.Forms.Button
$routeButton.Location = New-Object System.Drawing.Point(310, $y2)
$routeButton.Size = New-Object System.Drawing.Size(120, 50)
$routeButton.Text = "Route Table"
$routeButton.BackColor = [System.Drawing.Color]::FromArgb(46, 139, 87)
$routeButton.ForeColor = [System.Drawing.Color]::White
$routeButton.FlatStyle = "Flat"
$routeButton.Add_Click({
    Show-Results "route print" "Routing Table"
})
$form.Controls.Add($routeButton)

$arpButton = New-Object System.Windows.Forms.Button
$arpButton.Location = New-Object System.Drawing.Point(450, $y2)
$arpButton.Size = New-Object System.Drawing.Size(120, 50)
$arpButton.Text = "ARP Table"
$arpButton.BackColor = [System.Drawing.Color]::FromArgb(184, 134, 11)
$arpButton.ForeColor = [System.Drawing.Color]::White
$arpButton.FlatStyle = "Flat"
$arpButton.Add_Click({
    Show-Results "arp -a" "ARP Table"
})
$form.Controls.Add($arpButton)

$wifiButton = New-Object System.Windows.Forms.Button
$wifiButton.Location = New-Object System.Drawing.Point(590, $y2)
$wifiButton.Size = New-Object System.Drawing.Size(120, 50)
$wifiButton.Text = "WiFi Profiles"
$wifiButton.BackColor = [System.Drawing.Color]::FromArgb(128, 0, 128)
$wifiButton.ForeColor = [System.Drawing.Color]::White
$wifiButton.FlatStyle = "Flat"
$wifiButton.Add_Click({
    Show-Results "netsh wlan show profiles" "WiFi Profiles"
})
$form.Controls.Add($wifiButton)

# Row 3 Buttons (Network Repair Tools)
$y3 = 240

$flushDnsButton = New-Object System.Windows.Forms.Button
$flushDnsButton.Location = New-Object System.Drawing.Point(30, $y3)
$flushDnsButton.Size = New-Object System.Drawing.Size(120, 50)
$flushDnsButton.Text = "Flush DNS"
$flushDnsButton.BackColor = [System.Drawing.Color]::FromArgb(255, 69, 0)
$flushDnsButton.ForeColor = [System.Drawing.Color]::White
$flushDnsButton.FlatStyle = "Flat"
$flushDnsButton.Add_Click({
    Show-Results "ipconfig /flushdns" "DNS Flush Results"
})
$form.Controls.Add($flushDnsButton)

$renewIpButton = New-Object System.Windows.Forms.Button
$renewIpButton.Location = New-Object System.Drawing.Point(170, $y3)
$renewIpButton.Size = New-Object System.Drawing.Size(120, 50)
$renewIpButton.Text = "Renew IP"
$renewIpButton.BackColor = [System.Drawing.Color]::FromArgb(0, 191, 255)
$renewIpButton.ForeColor = [System.Drawing.Color]::White
$renewIpButton.FlatStyle = "Flat"
$renewIpButton.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("This will release and renew your IP address. Continue?", "IP Renewal", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
    if ($result -eq "Yes") {
        Show-Results "ipconfig /release; ipconfig /renew" "IP Renewal Results"
    }
})
$form.Controls.Add($renewIpButton)

$resetWinsockButton = New-Object System.Windows.Forms.Button
$resetWinsockButton.Location = New-Object System.Drawing.Point(310, $y3)
$resetWinsockButton.Size = New-Object System.Drawing.Size(120, 50)
$resetWinsockButton.Text = "Reset Winsock"
$resetWinsockButton.BackColor = [System.Drawing.Color]::FromArgb(178, 34, 34)
$resetWinsockButton.ForeColor = [System.Drawing.Color]::White
$resetWinsockButton.FlatStyle = "Flat"
$resetWinsockButton.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("This will reset Winsock catalog. A restart may be required. Continue?", "Reset Winsock", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)
    if ($result -eq "Yes") {
        Show-Results "netsh winsock reset" "Winsock Reset Results"
    }
})
$form.Controls.Add($resetWinsockButton)

$resetTcpButton = New-Object System.Windows.Forms.Button
$resetTcpButton.Location = New-Object System.Drawing.Point(450, $y3)
$resetTcpButton.Size = New-Object System.Drawing.Size(120, 50)
$resetTcpButton.Text = "Reset TCP/IP"
$resetTcpButton.BackColor = [System.Drawing.Color]::FromArgb(139, 0, 0)
$resetTcpButton.ForeColor = [System.Drawing.Color]::White
$resetTcpButton.FlatStyle = "Flat"
$resetTcpButton.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("This will reset TCP/IP stack. A restart may be required. Continue?", "Reset TCP/IP", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)
    if ($result -eq "Yes") {
        Show-Results "netsh int ip reset" "TCP/IP Reset Results"
    }
})
$form.Controls.Add($resetTcpButton)

$networkResetButton = New-Object System.Windows.Forms.Button
$networkResetButton.Location = New-Object System.Drawing.Point(590, $y3)
$networkResetButton.Size = New-Object System.Drawing.Size(120, 50)
$networkResetButton.Text = "Full Reset"
$networkResetButton.BackColor = [System.Drawing.Color]::FromArgb(220, 20, 60)
$networkResetButton.ForeColor = [System.Drawing.Color]::White
$networkResetButton.FlatStyle = "Flat"
$networkResetButton.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("This will perform a complete network reset. A restart is required. Continue?", "Full Network Reset", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)
    if ($result -eq "Yes") {
        Show-Results "netsh winsock reset; netsh int ip reset; ipconfig /release; ipconfig /renew; ipconfig /flushdns" "Full Network Reset Results"
    }
})
$form.Controls.Add($networkResetButton)

# Row 4 Buttons (Advanced Tools)
$y4 = 310

$firewallButton = New-Object System.Windows.Forms.Button
$firewallButton.Location = New-Object System.Drawing.Point(30, $y4)
$firewallButton.Size = New-Object System.Drawing.Size(120, 50)
$firewallButton.Text = "Firewall Status"
$firewallButton.BackColor = [System.Drawing.Color]::FromArgb(105, 105, 105)
$firewallButton.ForeColor = [System.Drawing.Color]::White
$firewallButton.FlatStyle = "Flat"
$firewallButton.Add_Click({
    Show-Results "netsh advfirewall show allprofiles" "Windows Firewall Status"
})
$form.Controls.Add($firewallButton)

$servicesButton = New-Object System.Windows.Forms.Button
$servicesButton.Location = New-Object System.Drawing.Point(170, $y4)
$servicesButton.Size = New-Object System.Drawing.Size(120, 50)
$servicesButton.Text = "Network Services"
$servicesButton.BackColor = [System.Drawing.Color]::FromArgb(72, 61, 139)
$servicesButton.ForeColor = [System.Drawing.Color]::White
$servicesButton.FlatStyle = "Flat"
$servicesButton.Add_Click({
    Show-Results "Get-Service | Where-Object {`$_.Name -like '*network*' -or `$_.Name -like '*dns*' -or `$_.Name -like '*dhcp*'}" "Network Services Status"
})
$form.Controls.Add($servicesButton)

$adapterButton = New-Object System.Windows.Forms.Button
$adapterButton.Location = New-Object System.Drawing.Point(310, $y4)
$adapterButton.Size = New-Object System.Drawing.Size(120, 50)
$adapterButton.Text = "Network Adapters"
$adapterButton.BackColor = [System.Drawing.Color]::FromArgb(25, 25, 112)
$adapterButton.ForeColor = [System.Drawing.Color]::White
$adapterButton.FlatStyle = "Flat"
$adapterButton.Add_Click({
    Show-Results "Get-NetAdapter | Select-Object Name, Status, LinkSpeed, MediaType" "Network Adapters"
})
$form.Controls.Add($adapterButton)

$bandwidthButton = New-Object System.Windows.Forms.Button
$bandwidthButton.Location = New-Object System.Drawing.Point(450, $y4)
$bandwidthButton.Size = New-Object System.Drawing.Size(120, 50)
$bandwidthButton.Text = "Bandwidth Monitor"
$bandwidthButton.BackColor = [System.Drawing.Color]::FromArgb(0, 100, 0)
$bandwidthButton.ForeColor = [System.Drawing.Color]::White
$bandwidthButton.FlatStyle = "Flat"
$bandwidthButton.Add_Click({
    Show-Results "Get-Counter '\Network Interface(*)\Bytes Total/sec' -MaxSamples 5 -SampleInterval 1" "Network Bandwidth Usage"
})
$form.Controls.Add($bandwidthButton)

$systemInfoButton = New-Object System.Windows.Forms.Button
$systemInfoButton.Location = New-Object System.Drawing.Point(590, $y4)
$systemInfoButton.Size = New-Object System.Drawing.Size(120, 50)
$systemInfoButton.Text = "System Info"
$systemInfoButton.BackColor = [System.Drawing.Color]::FromArgb(47, 79, 79)
$systemInfoButton.ForeColor = [System.Drawing.Color]::White
$systemInfoButton.FlatStyle = "Flat"
$systemInfoButton.Add_Click({
    Show-Results "Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, TotalPhysicalMemory, CsProcessors" "System Information"
})
$form.Controls.Add($systemInfoButton)

# Instructions Panel
$instructPanel = New-Object System.Windows.Forms.Panel
$instructPanel.Location = New-Object System.Drawing.Point(30, 380)
$instructPanel.Size = New-Object System.Drawing.Size(680, 120)
$instructPanel.BackColor = [System.Drawing.Color]::White
$instructPanel.BorderStyle = "FixedSingle"
$form.Controls.Add($instructPanel)

$instructLabel = New-Object System.Windows.Forms.Label
$instructLabel.Location = New-Object System.Drawing.Point(10, 10)
$instructLabel.Size = New-Object System.Drawing.Size(660, 100)
$instructLabel.Text = @"
INSTRUCTIONS:
• Click any button to run the corresponding network diagnostic tool
• Results will appear in a new window with detailed output
• Some operations may require administrator privileges
• Warning dialogs will appear for potentially disruptive operations
• Use 'Full Reset' only as a last resort - requires system restart
• For technical support, contact: cybersertex@outlook.com
"@
$instructLabel.Font = New-Object System.Drawing.Font("Arial", 9)
$instructLabel.TextAlign = "TopLeft"
$instructPanel.Controls.Add($instructLabel)

# Bottom Panel with Exit Button
$bottomPanel = New-Object System.Windows.Forms.Panel
$bottomPanel.Location = New-Object System.Drawing.Point(0, 520)
$bottomPanel.Size = New-Object System.Drawing.Size(800, 60)
$bottomPanel.BackColor = [System.Drawing.Color]::FromArgb(25, 25, 112)
$form.Controls.Add($bottomPanel)

$exitButton = New-Object System.Windows.Forms.Button
$exitButton.Location = New-Object System.Drawing.Point(350, 15)
$exitButton.Size = New-Object System.Drawing.Size(100, 30)
$exitButton.Text = "Exit"
$exitButton.BackColor = [System.Drawing.Color]::FromArgb(220, 20, 60)
$exitButton.ForeColor = [System.Drawing.Color]::White
$exitButton.FlatStyle = "Flat"
$exitButton.Add_Click({$form.Close()})
$bottomPanel.Controls.Add($exitButton)

$versionLabel = New-Object System.Windows.Forms.Label
$versionLabel.Location = New-Object System.Drawing.Point(20, 20)
$versionLabel.Size = New-Object System.Drawing.Size(300, 20)
$versionLabel.Text = "Version 2.0 - Advanced Network Troubleshooting Tool"
$versionLabel.Font = New-Object System.Drawing.Font("Arial", 8)
$versionLabel.ForeColor = [System.Drawing.Color]::LightGray
$versionLabel.BackColor = [System.Drawing.Color]::Transparent
$bottomPanel.Controls.Add($versionLabel)

# Show the form
[System.Windows.Forms.Application]::EnableVisualStyles()
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
