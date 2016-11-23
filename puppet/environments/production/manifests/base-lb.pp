class webserver { 
  
  class { 'nginx': }

  $servers = hiera('app_servers')

  file {
    "/etc/nginx/sites-available/default" :
      ensure  => 'file',
      owner   => 'root',
      content => template("/vagrant/nginx/default.erb");
  }

  File <|title == '/etc/nginx/sites-enabled/default'|> {
      ensure  => 'link',
      target  => '/etc/nginx/sites-available/default',
      require => File["/etc/nginx/sites-available/default"]
  }

} 

include webserver