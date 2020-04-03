class nodeapp {

  class { 'nodejs':
  }
  
  package { 'pm2':
    provider => 'npm',
    require  => Class['nodejs']
  }

}

include nodeapp