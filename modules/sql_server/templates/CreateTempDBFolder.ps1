$SQLService=”SQL Server (MSSQLSERVER)”
$SQLAgentService=”SQL Server Agent (MSSQLSERVER)”
$tempfolder="<%= @tempfolder %>"
if (!(test-path -path $tempfolder)) {
    New-Item -ItemType directory -Path $tempfolder
}
Start-Service $SQLService
Start-Service $SQLAgentService