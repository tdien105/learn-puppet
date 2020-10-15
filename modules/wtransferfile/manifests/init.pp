class wtransferfile {
	file { lookup('wfolder', String):
	  ensure => 'directory',
	  source => 'puppet:///modules/wtransferfile/',
	  recurse => 'remote',
	  path => lookup('wfolder', String),
	}
}