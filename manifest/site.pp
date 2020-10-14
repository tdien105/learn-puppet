file { '/root/README.md':
	ensure => file,
	content => 'hello Dien',
}

class remove_package {

  # remove a package but leave its config files alone
  package { 'docker':
    ensure => 'absent',
  }

  # remove a package and purge its config files
  package { 'docker':
    ensure => 'purged',
  }

}
include remove_package
