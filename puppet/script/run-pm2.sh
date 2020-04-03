
# pm2 part and add to systemd

/usr/bin/pm2 startup systemd
sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u vagrant --hp /home/vagrant
/usr/bin/pm2 start /vagrant/nodeapp/app.js
/usr/bin/pm2 save

# add routes to firewall
firewall-cmd --permanent --zone=public --add-rich-rule='
  rule family="ipv4"
  source address="192.168.33.10"
  port protocol="tcp" port="8080" accept'
firewall-cmd --reload
