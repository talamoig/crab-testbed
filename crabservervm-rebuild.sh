#!/bin/bash

source ~/.openrc 2> /dev/null

source crabservervm-common

if [[ $? != 0 ]]; then echo "~/.openrc not present. create it with openstack-init.sh"; exit 1; fi
echo "Rebuilding with image $IMAGE"
openstack server rebuild --image "$IMAGE" $VMNAME
