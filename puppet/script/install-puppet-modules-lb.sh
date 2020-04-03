#!/bin/bash

# update certificate to avoid error Could not connect via HTTPS to https://forgeapi.puppetlabs.com
yum -y update ca-certificates

puppet module install puppet-nginx --version 0.4.0
puppet module install puppetlabs-firewall --version 2.3.0