# Get the computer's serial number
$serialNumber = Get-WmiObject -Class Win32_Bios | Select-Object -ExpandProperty SerialNumber

#Declare PCS's computer
$PCSComputer = "PCS"

#Declare Prefix LP or DP
$LaptopPrefix = "LP"
$DesktopPrefix = "DP"

# Get the current computer name
$currentComputerName = $env:COMPUTERNAME

# Check if it's a laptop or desktop | $computerType.

$computerType = $DesktopPrefix # Default Desktop 
if ((Get-WmiObject -Class Win32_SystemEnclosure).ChassisTypes -contains 10) {
    $computerType = $LaptopPrefix  # If it's a laptop, then change it. Note: 10 is Notebook.
}

# Create new computer name
$newComputerName = "$PCSComputer-${serialNumber}-$computerType"

If($newComputerName = $currentComputerName){
    Write-Host "Computer name was already in the correct format!"
    }
Else{
# Set new computer name
Rename-Computer -NewName $newComputerName -Force
}

#Declare title
$title = "Computer Name / Domain Name" # Declare title

# Declare message
$message = "The name of this computer has been updated."

# Display the notification
Add-Type -AssemblyName PresentationFramework
[void] [System.Windows.MessageBox]::Show($message, $title,0,64)



