#Be sure to change the values for rePath, valueName and valueData to your own values
# Set the registry key path
$regPath = "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL"

# Set value name and value data
$valueName = "EventLogging"
$valueData = 0x0005 # 5 in hex

# Check if registry path exits, create if not
if (-Not (Test-Path $regPath)) {
  New-Item -Path -regPath -Force
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $valueName $valueData

# Output the result
Get-ItemProperty -Path $regPath -Name $valueName
