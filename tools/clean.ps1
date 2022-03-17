param(
[string] $location
)

if($location -eq '')
{
	Write-Host "No target provided. Using current directory as target."
	$location = $PWD
}

$target = resolve-path $location

Write-Host "Running From: $target"

write-host "removing bin folders"
get-childitem -path $target -filter bin -directory -recurse | foreach-object { $toDel = $_.FullName; Write-host "cleaning up $toDel";  remove-item $toDel -force -recurse}

write-host "removing obj folders"
get-childitem -path $target -filter obj -directory -recurse | foreach-object {  $toDel = $_.FullName; Write-host "cleaning up $toDel";  remove-item $toDel -force -recurse}

write-host "removing packages folders"
get-childitem -path "$target\packages" -recurse | foreach-object { $toDel = $_.FullName; Write-host "cleaning up $toDel";  remove-item $toDel -force -recurse}

write-host "removing temporary asp.net files from system folders"
get-childitem -path c:\windows\microsoft.net -filter "temporary asp.net files" -recurse | foreach-object {get-childitem $_.fullname -recurse | foreach-object { $toDel = $_.FullName; Write-host "cleaning up $toDel";  remove-item $toDel -force -recurse}}
get-childitem -path $env:LOCALAPPDATA\temp -filter "temporary asp.net files" | foreach-object {get-childitem $_.fullname -recurse | foreach-object { $toDel = $_.FullName; Write-host "cleaning up $toDel";  remove-item $toDel -force -recurse}}

write-host "clearing packages"
if((test-path -path c:\tools\nuget.exe) -eq $true){
  c:\tools\nuget.exe locals all -clear
}
