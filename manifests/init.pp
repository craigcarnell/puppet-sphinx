class sphinx(
  $centos_package = $sphinx::params::centos_package,
  $ubuntu_ppa = $sphinx::params::ubuntu_ppa
) inherits sphinx::params {

  contain sphinx::install
  contain sphinx::config
  contain sphinx::service

  Class['::sphinx::install'] ->
    Class['::sphinx::config'] ~>
    Class['::sphinx::service']
}
