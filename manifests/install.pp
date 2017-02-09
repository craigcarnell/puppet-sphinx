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

      apt::ppa { 'ppa:builds/sphinxsearch-rel22': }

      package { ["sphinxsearch"]:
        ensure => installed,
        require => Apt::Ppa['ppa:builds/sphinxsearch-rel22']
      }
    }
    centos,fedora,rhel: {
      package { 'postgresql-libs':
        ensure   => 'installed'
      }

      package { 'unixODBC':
        ensure   => 'installed'
      }

      # cd /tmp
      # wget http://sphinxsearch.com/files/sphinx-2.2.11-1.rhel7.x86_64.rpm
      wget::fetch { "sphinx":
        source      => 'http://sphinxsearch.com/files/sphinx-2.2.11-1.rhel7.x86_64.rpm',
        destination => '/tmp/sphinx-2.2.11-1.rhel7.x86_64.rpm',
        timeout     => 0,
        verbose     => false
      }

      exec {"install-sphinx" :
        command => "/usr/bin/rpm -Uhv /tmp/sphinx-2.2.11-1.rhel7.x86_64.rpm",
        creates => '/usr/bin/searchd',
        require => [ Wget::Fetch["sphinx"], Package["postgresql-libs"], Package["unixODBC"] ]
      }
    }
  }
}
