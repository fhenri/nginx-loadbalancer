#!/bin/bash

mkdir -p /etc/puppet/modules;

if [ ! -d /etc/puppet/modules/puppet-nginx ]; then
  puppet module install puppet-nginx --version 0.4.0
fi
