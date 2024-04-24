# Run the manage-bde -status command and store the output in $bde_status
$bde_status = manage-bde -status

# Initialize the variable to store the Conversion Status
$conversionStatus = $null

# Split the output into lines and loop through each line
foreach ($line in $bde_status -split "`n") {

    # Check if the line contains the Conversion Status
    if ($line -like "*Conversion Status:*") {

        # Extract the Conversion Status from the line
        $encryptionType = ($line -split ":")[1].Trim()
        # Exit the loop since we found the Conversion Status
    }
    if ($line -like "*Encryption Method:*") {
        # Extract the Encryption Method from the lin
        $encryptionMethod = ($line -split ":")[1].Trim()
        # Exit the loop since we found the Encryption Method
    }
}

# Check if the Conversion Status was found

if (-not $encryptionType) {
    Write-Output "Encryption type not found."
}

# Check if the Enryption Method was found
if (-not $encryptionMethod) {
    Write-Output "Encryption method not found."
}

# Combine and print out data for pre-remediation detection output
$combined_data = "$encryptionType, $encryptionMethod"
$combined_data
