class webserver { 
  
  class { 'nginx': 
    manage_repo     => true,
    package_source  => 'nginx-stable'
  }

  $servers = hiera('app_servers')

  file {
    "/etc/nginx/sites-available/default" :
      ensure  => 'file',
      owner   => 'root',
      content => template("/tmp/vagrant-puppet/environments/production/nginx/default.erb");
  }

  File <|title == '/etc/nginx/sites-enabled/default'|> {
      ensure  => 'link',
      target  => '/etc/nginx/sites-available/default',
      require => File["/etc/nginx/sites-available/default"]
  }

  firewall { '100 allow http and https access':
    dport  => [80, 443],
    proto  => 'tcp',
    action => 'accept',
  }
}

include webserver
include firewall