node "ec2amaz-14rg7lb.ap-southeast-1.compute.internal" {
	include wtransferfile

	scheduled_task { 'Create temp dir on boot':
	  ensure        => 'present',
	  compatibility => 2,
	  command       => "$::system32\\WindowsPowerShell\\v1.0\\powershell.exe",
	  arguments     => '-File "D:\\SQLDATA\\sqlstartuptempdb.ps1"',
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