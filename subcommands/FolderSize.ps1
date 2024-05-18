function global:FolderSize {
    param (
        [string]$FolderPath,
        [bool]$ShowErrors
    )
    Write-Host "Calculating folder size for: $FolderPath"
    if (-not (Test-Path -Path $FolderPath -PathType Container)) {
        if ($ShowErrors) {
            Write-Host "Error: Folder not found: $FolderPath"
        }
        return
    }
    $size = 0
    try {
        $size = (Get-ChildItem -Path $FolderPath -Recurse -File -ErrorAction SilentlyContinue | ForEach-Object {
            if ($null -ne $_.Length) {
                $_.Length
            }
        } | Measure-Object -Sum).Sum
    } catch {
        if ($ShowErrors) {
            Write-Host "Error accessing folder: $($_.Exception.Message)"
        }
    }
    if ($size -eq 0) {
        Write-Host "No files found in folder: $FolderPath"
        return
    }
    $prefixes = "B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"
    $index = 0
    while ($size -ge 1024 -and $index -lt $prefixes.Count - 1) {
        $size /= 1024
        $index++
    }
    $sizeFormatted = "{0:N2} {1}" -f $size, $prefixes[$index]
    Write-Host "Folder Size: $sizeFormatted"
}   
