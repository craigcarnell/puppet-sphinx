class sphinx::service {

  case $operatingsystem {
    debian,ubuntu: {
      service { 'sphinxsearch':
        ensure => running,
        enable => true
      }
    }
    centos,fedora,rhel: {
      file { '/usr/lib/systemd/system/searchd.service':
        ensure  => 'file',
        owner   => 'root',
        group   => 'root',
        content => template("${module_name}/usr/lib/systemd/system/searchd.service.erb")
      }

      service { 'searchd':
        ensure => running,
        enable => true
      }
    }
  }
}
