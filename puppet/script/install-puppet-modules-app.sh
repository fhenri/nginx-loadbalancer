#!/bin/bash

# nodejs module has dependency on apt but its not declared
puppet module install puppetlabs-apt --version 2.3.0
puppet module install puppet-nodejs --version 2.1.0
