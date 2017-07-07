Add-PSSnapin "Microsoft.SharePoint.PowerShell"
Set-ExecutionPolicy -ExecutionPolicy "Unrestricted" -Force
Backup-SPFarm -Verbose -BackupMethod Differential -Directory \\statbspapp\Backup