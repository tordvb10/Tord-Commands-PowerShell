# Define the Tord function
function Tord {
    param (
        [string]$SubCommand,
        [string]$FolderPath = (Get-Location).Path,
        [bool]$ShowErrors = $true
    )

    # Check if Get-FolderSize function is already loaded
    if (-not (Get-Command Get-FolderSize -ErrorAction SilentlyContinue)) {
        # Load the script containing the Get-FolderSize function
        $scriptPath = Join-Path $PSScriptRoot "subcommands\Get-FolderSize.ps1"
        if (Test-Path $scriptPath) {
            . $scriptPath
            Write-Host "Get-FolderSize function loaded."
        } else {
            Write-Host "Failed to load Get-FolderSize.ps1. Please make sure the script exists in the correct location."
            return
        }
    }

    Write-Host "Tord function called with SubCommand: $SubCommand"

    if (-not $SubCommand) {
        Write-Host "Subcommand not provided"
        return
    }

    switch ($SubCommand) {
        "FolderSize" {
            Write-Host "Executing Get-FolderSize"
            Get-FolderSize -FolderPath $FolderPath -ShowErrors $ShowErrors
            return
        }
        default {
            Write-Host "Unknown subcommand: $SubCommand"
            return
        }
    }
}
