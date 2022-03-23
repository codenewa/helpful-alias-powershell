param([string] $command)

$username="admin_as@texpac"
$encPasswd = Get-content c:\tools\creds-a.bin
$password = convertTo-secureString $encPasswd
# use this for plaintext password
#$password=  (convertto-securestring -string $plainTextPassword -asplaintext -force)
$credentials = new-object system.management.automation.pscredential -argumentlist @($username,$password)
# $credentials = get-credential

$commandPath = ""
$canRun = $false

switch($command)
{
	"np" { $commandPath = "C:\Program Files\Notepad++\notepad++.exe"; }
	"code" {$commandPath = "code"} 
	"wt"{ $commandPath = "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.11.3471.0_x64__8wekyb3d8bbwe\wt.exe" }
	default { Write-Host "This alias allows you to open np:notepad++, code: VSCode, wt: Windows Terminal with your admin credentials. If you haven't set your credentials yet, use the `passwd -admin` command to set your admin password." }
}

if($commandPath -ne ''){
	Start-Process $commandPath -WorkingDirectory . -Credential ($credentials)
}

