# Get the list of servers from the file
$servers = Get-Content -Path "C:\Path\To\servers.txt"

# Path to the file to check on remote servers
$fileToCheck = "C$\Windows\Temp\test.txt"

# Loop through each server and check if the file exists
foreach ($server in $servers) {
    $remotePath = "\\$server\$fileToCheck"
    $fileExists = Test-Path -Path $remotePath -PathType Leaf

    if ($fileExists) {
        Write-Host "File $fileToCheck exists on $server"
        $userInput = Read-Host "Do you want to delete the file (y/n)?"
        if ($userInput -eq "y") {
            Invoke-Command -ScriptBlock {
                param($path)
                rm $path
            } -ArgumentList $remotePath
            Write-Host "Removing file: $fileToCheck"
        } else {
          Write-Host "File not removed"
    } else {
        Write-Host "File $fileToCheck does not exist on $server"
    }
}
