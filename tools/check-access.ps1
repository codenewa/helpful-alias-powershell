param(
[string] $user
)
Write-Host "Checking on $pwd"
Write-Host "checking for TEXPAC\$user"
get-ntfseffectiveaccess -path $pwd -account "TEXPAC\$user"