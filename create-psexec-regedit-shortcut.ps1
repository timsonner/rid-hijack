# Final Shortcut Target: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -WindowStyle Hidden -Command Start-Process -NoNewWindow 'c:\tools\pstools\psexec64.exe' '-i -s regedit'

# Define the path to the shortcut
$shortcutPath = "$env:USERPROFILE\Desktop\r3g3dit.lnk"

# Create a new WScript.Shell COM object
$WshShell = New-Object -ComObject WScript.Shell

# Create the shortcut
$Shortcut = $WshShell.CreateShortcut($shortcutPath)
$Shortcut.TargetPath = "powershell.exe"
$Shortcut.Arguments = "-WindowStyle Hidden -Command Start-Process -NoNewWindow 'c:\tools\pstools\psexec64.exe' '-i -s regedit'"
$Shortcut.IconLocation = "regedit.exe,0"
$Shortcut.Save()
