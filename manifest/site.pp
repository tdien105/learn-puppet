file { '/root/README.md':
	ensure => file,
	content => 'hello Dien',
}

class remove_package {

  # remove a package but leave its config files alone
  package { 'docker':
    ensure => 'absent',
  }
}
include docker
