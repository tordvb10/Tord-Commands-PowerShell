function Tord {
    param (
        [string]$SubCommand,
        [string]$FolderPath = (Get-Location).Path,
        [bool]$ShowErrors = $true
    )

    # Function to import subcommand script
    function Import-SubCommandScript {
        param (
            [string]$SubCommand
        )

        $scriptPath = Join-Path $PSScriptRoot "subcommands\$SubCommand.ps1"
        Write-Host "Looking for script at path: $scriptPath"

        if (Test-Path $scriptPath) {
            . $scriptPath
            Write-Host "$SubCommand function loaded into global scope."
        } else {
            Write-Host "Failed to load $SubCommand.ps1. Please make sure the script exists in the correct location."
            return $false
        }

        return $true
    }

    # Check if SubCommand is provided
    if (-not $SubCommand) {
        Write-Host "Subcommand not provided"
        return
    }

    # Load the subcommand script
    Import-SubCommandScript -SubCommand $SubCommand

    # Execute the subcommand function
    Write-Host "Tord function called with SubCommand: $SubCommand"
    & $SubCommand -FolderPath $FolderPath -ShowErrors $ShowErrors
}
