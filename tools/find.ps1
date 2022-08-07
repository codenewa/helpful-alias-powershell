param(
[string] $part
)

get-childitem -recurse -filter "*$part*.*" |Format-Table -Property Name,FullName
