node "ec2amaz-bdbt3aa.ap-southeast-1.compute.internal" {
	include sql_server
}

node "default" {
	notify{"Default"}
}