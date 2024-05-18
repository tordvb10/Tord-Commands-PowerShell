function global:BatteryLevel {
    param (
        [string]$FolderPath,
        [bool]$ShowErrors
    )
    
    Write-Host "BatteryLevel at: "(Get-WmiObject -Class Win32_Battery).EstimatedChargeRemaining"%"
}
