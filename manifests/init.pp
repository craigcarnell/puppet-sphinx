class sphinx(
  $centos_package = $sphinx::params::centos_package,
  $ubuntu_ppa = $sphinx::params::ubuntu_ppa,
  $sql_host   = undef,
  $sql_port   = undef,
  $sql_user   = undef,
  $sql_pass   = undef,
  $sql_db     = undef,
  $listen_ip = undef,
  $listen_post = undef,
  $config_file = undef,
  $indexer_mem_limit = '32M'
) inherits sphinx::params {

  contain sphinx::install
  contain sphinx::config
  contain sphinx::service

  Class['::sphinx::install'] ->
    Class['::sphinx::config'] ~>
    Class['::sphinx::service']
}
