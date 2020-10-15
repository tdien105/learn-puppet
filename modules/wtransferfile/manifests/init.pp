class wtransferfile {
	file { lookup('wfolder', String):
	  ensure => 'directory',
	  source => 'puppet:///modules/wtransferfile/files',
	  recurse => 'remote',
	  path => lookup('wfolder', String),
	}
}