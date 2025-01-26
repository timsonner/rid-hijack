param (
    [switch]$LittleEndian
)

function Convert-DecimalToHex {
    param (
        [Parameter(Mandatory=$true)]
        [int[]]$Numbers,

        [switch]$LittleEndian
    )

    foreach ($num in $Numbers) {
        $hex = "{0:X}" -f $num
        
        # Ensure hex string has an even number of characters
        if ($hex.Length % 2 -ne 0) {
            $hex = "0$hex"
        }
        
        if ($LittleEndian.IsPresent) {
            # Split hex string into byte pairs and reverse the byte order
            $hexBytes = $hex -split '(.{2})' | Where-Object { $_ -ne '' }
            $littleEndianHex = -join ($hexBytes | Sort-Object -Descending)
            Write-Output "Decimal: $num -> Little-Endian Hex: $littleEndianHex"
        } else {
            Write-Output "Decimal: $num -> Hex: $hex"
        }
    }
}

$numbers = (Read-Host "Numbers")

# If command line flag is present
if ($LittleEndian.IsPresent) {
    Convert-DecimalToHex -Numbers $numbers -LittleEndian
} else {
    Convert-DecimalToHex -Numbers $numbers
}
