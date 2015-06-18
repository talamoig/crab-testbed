#!/bin/bash

sudo yum -y install git.x86_64
mkdir -p /tmp/foo
cd /tmp/foo
git clone git://github.com/dmwm/deployment.git cfg
cfg/Deploy -t dummy -s post $PWD system/devvm
#rm -fr /tmp/foo

echo "You should now reboot, prepare paramsrc file and then launch part2"
