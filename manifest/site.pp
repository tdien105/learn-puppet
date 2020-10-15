node "ec2amaz-14rg7lb.ap-southeast-1.compute.internal" {
	
	$folder = 'C:\SQLDATA'
	$scriptname  = 'sqlstartuptempdb.ps1'


	file { $folder:
	  ensure => 'directory',
	}

	file { "${folder}\\${scriptname}":
	  ensure => file,
	  source => 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fstatic.packt-cdn.com%2Fproducts%2F9781785281877%2Fgraphics%2FB04731_CH05_17.jpg&imgrefurl=https%3A%2F%2Fsubscription.packtpub.com%2Fbook%2Fnetworking_and_servers%2F9781785281877%2F5%2Fch05lvl1sec37%2Fthe-puppet-templates&tbnid=DEybjWG3-1wMKM&vet=12ahUKEwiyrryan7bsAhVWnEsFHTCBBiYQMygAegUIARCSAQ..i&docid=BRthR4VHVb-1pM&w=990&h=325&q=puppet%20file%20content%20from%20template&ved=2ahUKEwiyrryan7bsAhVWnEsFHTCBBiYQMygAegUIARCSAQ',

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