class sphinx::params() {
  $centos_package = "sphinx-2.2.11-1.rhel7.x86_64.rpm"
  $ubuntu_ppa = "ppa:builds/sphinxsearch-rel22"
  $base_path = '/var/lib'
  $config_path = '/etc/sphinx'

  $port = 9312
  $port_mysql41 = 9306

  $indexer_mem_limit	= "128M"
}
