#!/bin/bash
# from http://clouddocs.web.cern.ch/clouddocs/tutorial/create_your_openstack_profile.html

source crabservervm-common

nslookup $VMNAME > /dev/null 
if [[ $? == 0 ]]; then echo "$VMNAME already present in the DNS. Exiting..."; exit 1; fi

source ~/.openrc 2> /dev/null
if [[ $? != 0 ]]; then echo "~/.openrc not present. create it with openstack-init.sh"; exit 1; fi

openstack server list  | grep $VMNAME > /dev/null && (echo "$VMNAME already present in your openstack instances. Exiting..." && exit 1)
echo "Building $VMNAME with image $IMAGE"
openstack server create --flavor m1.large --image "$IMAGE" $VMNAME
