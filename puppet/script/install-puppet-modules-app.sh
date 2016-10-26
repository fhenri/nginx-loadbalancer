#!/bin/bash

mkdir -p /etc/puppet/modules;

if [ ! -d /etc/puppet/modules/puppet-nodejs ]; then
  puppet module install puppet-nodejs --version 2.1.0
fi
