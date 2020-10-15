node "ec2amaz-14rg7lb.ap-southeast-1.compute.internal" {
	include wtransferfile
}

node "default" {
	notify { 'hello Puppet':
	  message  => "Hi, there",
	}
}