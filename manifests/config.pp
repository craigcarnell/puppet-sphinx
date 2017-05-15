class sphinx::config(

) inherits sphinx {

  if($config_file) {
    file { $sphinx_config_file:
      ensure => present,
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      content => template($config_file),
      notify  => Class['sphinx::service']
    }
  }

  if($base_path) {
    file { "{$base_path}_${listen_port}":
      owner   => 'sphinx',
      recurse => true
    }
  }
}
