# Calculate the time when the restart will occur
$restartTime = (Get-Date).AddMinutes(40)

# Convert the restart time to user-friendly format
$restartTimeString = $restartTime.ToString('HH:mm')


$title = "Configuration is in Progress" # Declare title

# Declare message
$message = "Your computer has scheduled to resrart at $restartTimeString
"

# Display the notification
Add-Type -AssemblyName PresentationFramework
[void] [System.Windows.MessageBox]::Show($message, $title,0,46)

# Schedule the computer to restart
shutdown.exe /r -t 2400