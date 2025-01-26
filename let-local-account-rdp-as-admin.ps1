# Run as command:
# reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /t REG_DWORD /v LocalAccountTokenFilterPolicy /d 1

# Run with hard coded vars:
# $RegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
# $ValueName = "LocalAccountTokenFilterPolicy"
# $Data = 1
# $ValueType = "DWORD"
# New-ItemProperty -Path $RegistryPath -Name $ValueName -Value $Data -PropertyType $ValueType

# Create the registry key and set its value to true. This allows admin accounts to RDP and maintain admin privileges.
New-ItemProperty -Path (Read-Host "Registry path") -Name (Read-Host "Name") -Value (Read-Host "Value") -PropertyType (Read-Host "Type")
