#!/bin/bash

if [ $# -ne 1 ]
then
echo "Usage: $0 <vm-name>"
exit 1
fi

VMNAME=$1

source ~/.openrc 2> /dev/null
if [[ $? != 0 ]]; then echo "~/.openrc not present. create it with openstack-init.sh"; exit 1; fi

IMAGE=`openstack image list -c Name -f csv|grep "SLC6 Server - x86_64"|head -1|tr -d '"'`
echo "Rebuilding with image $IMAGE"
openstack server rebuild --image "$IMAGE" $VMNAME
