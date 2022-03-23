param ([switch] $admin)

$file = "C:\tools\creds.bin"
if($admin){
	$file="c:\tools\creds-a.bin"
}

$passwd = read-host "enter password" -asSecureString
$encPassword = convertFrom-securestring $passwd
$encPassword > $file
