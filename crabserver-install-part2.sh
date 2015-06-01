#!/bin/bash

git clone git://github.com/dmwm/deployment.git /data/cfg
cd /data/cfg
HGVER=`git tag -l 'HG*'|tail -1`
git reset --hard $HGVER
REPO="-r comp=comp.pre" A=/data/cfg/admin
cd /data
$A/InstallDev -R comp@$HGVER -A slc6_amd64_gcc481 -s image -v $HGVER $REPO -p "admin/devtools frontend crabserver crabcache"
