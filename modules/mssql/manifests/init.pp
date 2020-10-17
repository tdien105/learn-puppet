class mssql {
  $server_puppet_dir = 'C:\SQLDATA'
  $tempfolder = lookup('mssql_tempdir')
  $create_dir_scriptname = 'CreateTempDBFolder.ps1'
  $_source = 'https://i1-giaitri.vnecdn.net/2019/07/29/na-tra4-2044-1564382699.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=KhvDzshLBihZzMGkMxBQVA'

  file { $tempfolder:
    ensure => directory,
  }

  file { $server_puppet_dir:
    ensure => directory,
  }

  file { 'Create MSSQL TempDB Folder':
    name   => "${server_puppet_dir}${create_dir_scriptname}",
    source => $_source,
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