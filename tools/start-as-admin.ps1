param([string] $command)

$username="your-user-name"
$password="your-password"

$credentials = new-object system.management.automation.pscredential -argumentlist @($username,(convertto-securestring -string $password -asplaintext -force))
# $credentials = get-credential

$commandPath = ""
$canRun = $false

switch($command)
{
	"np" { $commandPath = "C:\Program Files\Notepad++\notepad++.exe"; }
	"code" {$commandPath = "code"} 
	"wt"{ $commandPath = "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.11.3471.0_x64__8wekyb3d8bbwe\wt.exe" }
	default { Write-Host "The path for this command: $command is not registered."}
}

if($commandPath -ne ''){
	Start-Process $commandPath -WorkingDirectory . -Credential ($credentials)
}

