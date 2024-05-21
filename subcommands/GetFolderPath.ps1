function global:GetFolderPath {
    param (
        [string]$FolderPath,
        [bool]$ShowErrors
    )
    Write-Host "CurrentFolderPath is added to clipboard"
    $FolderPath | clip
    return 
}
