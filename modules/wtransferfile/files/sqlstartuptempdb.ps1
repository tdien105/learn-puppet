$SQLService=”SQL Server (MSSQLSERVER)”
$SQLAgentService=”SQL Server Agent (MSSQLSERVER)”
$tempfolder="C:\SQLSQL"

if (!(test-path -path $tempfolder)) {
    New-Item -ItemType directory -Path $tempfolder
}
