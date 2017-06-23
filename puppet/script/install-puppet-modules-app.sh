#!/bin/bash

# nodejs module has dependency on apt but its not declared
puppet module install puppetlabs-apt --version 2.3.0
puppet module install willdurand-nodejs --version 2.0.0-alpha2