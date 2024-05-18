function global:BatteryLevel {
    param (
        [string]$FolderPath,
        [bool]$ShowErrors
    )
    
    Write-Host (Get-WmiObject -Class Win32_Battery).EstimatedChargeRemaining
}
