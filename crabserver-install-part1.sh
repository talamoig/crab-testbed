#!/bin/bash

CERT=certs/`hostname -s`-hostcert.pem
KEY=certs/`hostname -s`-hostkey.pem
sudo mkdir /etc/grid-security
if [ -f $CERT -a $KEY ]
then
sudo cp $CERT /etc/grid-security/hostcert.pem
sudo cp $KEY /etc/grid-security/hostkey.pem
sudo chmod 600 /etc/grid-security/hostkey.pem
fi
sudo yum -y install git.x86_64
mkdir -p /tmp/foo
cd /tmp/foo
git clone git://github.com/dmwm/deployment.git cfg
yes | cfg/Deploy -t dummy -s post $PWD system/devvm
echo 'you can now reboot and then launch crabserver-install-part2.sh'
#sudo reboot
