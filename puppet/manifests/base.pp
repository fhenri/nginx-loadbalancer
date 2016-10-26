Package {
  allow_virtual => true,
}

class { 'nginx': }
class { 'nodejs': }

include nginx
include nodejs