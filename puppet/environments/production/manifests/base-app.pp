class nodeapp {

  class { 'nodejs': }
  
  exec {
    'run-app':
      command   => "node /vagrant/nodeapp/app.js &> /home/vagrant/app.log.out&",
      cwd       => '/home/vagrant',
      path      => '/usr/bin',
      user      => vagrant,
      logoutput => on_failure,
      require   => Class["nodejs"];
  }
}

include nodeapp