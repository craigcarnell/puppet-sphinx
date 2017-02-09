class sphinx(
) inherits sphinx::params {

  contain sphinx::install
  contain sphinx::config
  #contain sphinx::service

  Class['::sphinx::install'] ->
    Class['::sphinx::config'] # ~>
  #Class['::sphinx::service']
}
