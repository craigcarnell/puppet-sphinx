class sphinx(
  $centos_package = $sphinx::params::centos_package,
  $ubuntu_ppa = $sphinx::params::ubuntu_ppa,
  $sql_host   = undef,
  $sql_port   = undef,
  $sql_user   = undef,
  $sql_pass   = undef,
  $sql_db     = undef,
  $base_path  = $sphinx::params::base_path,
  $config_path  = $sphinx::params::config_path,
  $listen_ip = undef,
  $listen_port = $sphinx::params::port,
  $config_template = undef,
  $port = $sphinx::params::port,
  $port_mysql41 = $sphinx::params::port_mysql41,
  $indexer_mem_limit = $sphinx::params::indexer_mem_limit,

) inherits sphinx::params {

  contain sphinx::install
  contain sphinx::config
  contain sphinx::service

  Class['::sphinx::install'] ->
    Class['::sphinx::config'] ~>
    Class['::sphinx::service']
}
