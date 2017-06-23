class nodeapp {

  class { 'nodejs':
    version => 'v6.0.0',
  }
  
  package { 'pm2':
    provider => 'npm',
    require  => Class['nodejs']
  }

}

include nodeapp