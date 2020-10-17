
class sql_server
{
  
  $server_puppet_dir = "C:\SQLDATA"
  $tempfolder = lookup('mssql_tempdir')
  $create_dir_scriptname = 'CreateTempDBFolder.ps1'

  file { 'Create MSSQL TempDB Folder':
    name   => "${server_puppet_dir}${create_dir_scriptname}",
    source => template('sql_server/${create_dir_scriptname}.erb')
  }

  scheduled_task { 'Create MSSQL TempDB Folder on boot':
	  ensure        => 'present',
	  compatibility => 2,
	  command       => "${::system32}\\WindowsPowerShell\\v1.0\\powershell.exe",
	  arguments     => "-File ${server_puppet_dir}${create_dir_scriptname}",
	  enabled       => 'true',
	  trigger       => [{
	    'schedule'  => 'boot',
	  }],
	  user          => 'system',
	}

}
