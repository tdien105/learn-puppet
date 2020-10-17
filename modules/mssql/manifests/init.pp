class sql_server {
  $server_puppet_dir = 'C:\SQLDATA'
  $tempfolder = lookup('mssql_tempdir')
  $  = 'CreateTempDBFolder.ps1'


  file { $tempfolder:
    ensure => directory,
  }

  file { $server_puppet_dir:
    ensure => directory,
  }

  file { "${::server_puppet_dir}\\${::create_dir_scriptname}":
    ensure   => file,
    content => template("mssql/${::create_dir_scriptname}.ps1.erb"),
  }

  scheduled_task { 'Create MSSQL TempDB Folder on boot':
    ensure        => 'present',
    compatibility => 2,
    command       => "${::system32}\\WindowsPowerShell\\v1.0\\powershell.exe",
    arguments     => "-File ${::server_puppet_dir}\\${::create_dir_scriptname}",
    enabled       => 'true',
    trigger       => [{
      'schedule'  => 'boot',
    }],
    user          => 'system',
  } 
}