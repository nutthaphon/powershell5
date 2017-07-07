
Import-Module sqlps -DisableNameChecking 
 
$conn = new-object Microsoft.SqlServer.Management.Common.ServerConnection 
$conn.LoginSecure = $FALSE 
$conn.Login = "sa" 
$conn.Password = "p@ssw0rd" 
$conn.ServerInstance = "STATBSPDB" 

$srv = new-object Microsoft.SqlServer.Management.Smo.Server($conn) 
$srv | select Name, Edition, BuildNumber, Product, ProductLevel, Version, Processors, PhysicalMemory, DefaultFile, DefaultLog, MasterDBPath, MasterDBLogPath, BackupDirectory, ServiceAccount 

$db = $srv.Databases["master"] 
 
$result = $db.ExecuteWithResults("SELECT DB_NAME() as [Database]") 
$result.Tables[0] 
 
$srv.JobServer.Jobs | Where-Object {$_.IsEnabled -eq $TRUE} | Select Name,LastRunOutcome, LastRunDate,IsEnabled
 
