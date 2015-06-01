#!/bin/bash

source crabservervm-common

source ~/.openrc 2> /dev/null

if [[ $? != 0 ]]; then echo "~/.openrc not present. create it with openstack-init.sh"; exit 1; fi
echo "Rebuilding with image $IMAGE"
openstack server rebuild --image "$IMAGE" $VMNAME
