class sphinx::config(

) inherits sphinx {

  if($config_template) {
    file { "${config_path}/sphinx_${listen_port}.conf":
      ensure => present,
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      content => template($config_template),
      notify  => Class['sphinx::service']
    }
  }

  file { "${base_path}/${listen_port}":
    owner   => 'sphinx',
    recurse => true
  }
}

