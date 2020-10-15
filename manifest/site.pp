node "ec2amaz-14rg7lb.ap-southeast-1.compute.internal" {
	
	$folder = 'C:\SQLDATA'
	$scriptname  = 'sqlstartuptempdb.ps1'

	file { $folder:
	  ensure => 'directory',
	  source => 'puppet:///modules/static/',
	  recurse => 'remote',
	  path => $folder,
	}

	scheduled_task { 'Create temp dir on boot':
	  ensure        => 'present',
	  compatibility => 2,
	  command       => "$::system32\\WindowsPowerShell\\v1.0\\powershell.exe",
	  arguments     => "-File ${folder}\\${scriptname}",
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