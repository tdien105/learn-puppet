file { '/root/README.md':
	ensure => file,
	content => 'hello Dien',
}

include 'docker'
