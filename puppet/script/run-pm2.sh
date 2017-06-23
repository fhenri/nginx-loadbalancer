/usr/local/node/node-v6.0.0/lib/node_modules/pm2/bin/pm2  startup upstart
sudo env PATH=$PATH:/usr/local/node/node-v6.0.0/bin /usr/local/node/node-v6.0.0/lib/node_modules/pm2/bin/pm2 startup upstart -u vagrant --hp /home/vagrant
/usr/local/node/node-v6.0.0/lib/node_modules/pm2/bin/pm2 start /vagrant/nodeapp/app.js
/usr/local/node/node-v6.0.0/lib/node_modules/pm2/bin/pm2 save