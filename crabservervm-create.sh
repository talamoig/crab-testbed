#!/bin/bash
# from http://clouddocs.web.cern.ch/clouddocs/tutorial/create_your_openstack_profile.html

if [ $# -ne 2 ]
then
echo "Usage: $0 <vm-name> <image>"
echo "Please use one of the following images:"
openstack image list -f csv -c Name|grep "SLC6 CERN Server - x86_64"
exit 1
fi

VMNAME=$1
IMAGE=$2

nslookup $VMNAME > /dev/null 
if [[ $? == 0 ]]; then echo "$VMNAME already present in the DNS. Exiting..."; exit 1; fi

source ~/.openrc 2> /dev/null
if [[ $? != 0 ]]; then echo "~/.openrc not present. create it with openstack-init.sh"; exit 1; fi

openstack server list  | grep $VMNAME > /dev/null && (echo "$VMNAME already present in your openstack instances. Exiting..." && exit 1)
echo "Building $VMNAME with image $IMAGE"
openstack server create --flavor m1.large --image "$IMAGE" $VMNAME
