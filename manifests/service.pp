class sphinx::service {

  case $operatingsystem {
    debian,ubuntu: {
      service { 'sphinxsearch':
        ensure => running,
        enable => true
      }
    }
    centos,fedora,rhel: {
      service { 'searchd':
        ensure => running,
        enable => true
      }
    }
  }
}
