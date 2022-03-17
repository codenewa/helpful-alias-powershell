param(
[string] $part
)

get-childitem -recurse -filter "*$part*.*"
