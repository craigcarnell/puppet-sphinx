class sphinx::install {

  case $operatingsystem {
    debian,ubuntu: {
      package { ["mysql-client"]:
        ensure => installed
      }

      package { ["unixodbc"]:
        ensure => installed
      }

      package { ["libpq5"]:
        ensure => installed
      }

      apt::ppa { $sphinx::ubuntu_ppa: }

      package { ["sphinxsearch"]:
        ensure => installed,
        require => Apt::Ppa[$sphinx::ubuntu_ppa]
      }
    }
    centos,fedora,rhel: {
      package { 'postgresql-libs':
        ensure   => 'installed'
      }

      package { 'unixODBC':
        ensure   => 'installed'
      }

      wget::fetch { "sphinx":
        source      => "http://sphinxsearch.com/files/$sphinx::centos_package",
        destination => "/tmp/$sphinx::centos_package",
        timeout     => 0,
        verbose     => false
      }

      exec {"install-sphinx" :
        command => "/usr/bin/rpm -Uhv /tmp/$sphinx::centos_package",
        creates => '/usr/bin/searchd',
        require => [ Wget::Fetch["sphinx"], Package["postgresql-libs"], Package["unixODBC"] ]
      }
    }
  }
}
