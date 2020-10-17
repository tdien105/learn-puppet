class mssql {
  $server_puppet_dir = 'C:\SQLDATA'
  $tempfolder = lookup('mssql_tempdir')
  $create_dir_scriptname = 'CreateTempDBFolder.ps1'
  $_source = "https://asean2010.vn/wp-content/uploads/2020/04/hinh-nen-dien-thoai-1-576x1024.jpg" # url/path to script file on our server (puppet files)

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