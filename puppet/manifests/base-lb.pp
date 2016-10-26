Package {
  allow_virtual => true,
}

class { 'nginx': }

include nginx
