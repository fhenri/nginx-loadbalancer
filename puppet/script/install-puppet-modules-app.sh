#!/bin/bash

# update certificate to avoid error Could not connect via HTTPS to https://forgeapi.puppetlabs.com
yum -y update ca-certificates

puppet module install puppet-epel --version 3.0.1
puppet module install puppet-nodejs --version 8.0.0
