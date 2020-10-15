node "ec2amaz-14rg7lb.ap-southeast-1.compute.internal" {
	
	$folder = 'C:\SQLDATA'
	$scriptname  = 'sqlstartuptempdb.ps1'


	file { $folder:
	  ensure => 'directory',
	}

	file { "${folder}\\${scriptname}":
	  ensure => file,
	  source => 'https://danviet.mediacdn.vn/upload/2-2019/images/2019-05-24/Vi-dau-sieu-pham-hoat-hinh-he-Doraemon-vua-quen-vua-la-unnamed--8--1558666578-width739height559.png',

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