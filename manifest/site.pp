node default {
	file { '/root/README.md':
		ensure => file,
		content => 'hello',
	}
}
