function global:GitStart {
    param (
        [string]$FolderPath,
        [bool]$ShowErrors,
        [string]$Repo
    )
    git init
    git add .
    git commit -m "first"
    gh repo create $Repo --remote=origin --public --source=. --push
    return 
}
