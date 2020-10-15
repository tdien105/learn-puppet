node "ec2amaz-14rg7lb.ap-southeast-1.compute.internal" {
	
	$folder_path = 'C:\SQLDATA'
	$scriptname  = 'sqlstartuptempdb.ps1'

	file { $folder_path:
	  ensure => directory,

	}

	file { "${folder_path}\\${scriptname}":
	  ensure => file,
	  source => "puppet:///files/${scriptname}",
	}

	scheduled_task { 'Create temp dir on boot':
	  ensure        => 'present',
	  compatibility => 2,
	  command       => "$::system32\\WindowsPowerShell\\v1.0\\powershell.exe",
	  arguments     => "-File ${folder_path}\\${scriptname}",
	  enabled       => 'true',
	  trigger       => [{
	    'schedule'  => 'boot',
	  }],
	  user          => 'system',
	}

}

node "default" {
	notify { 'hello Puppet':
	  message  => "Hi, there",
	}
}