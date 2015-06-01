# Crab Server Installation Scripts

This repo contains scripts to build a CRAB 3 development testbed.

Is assumes you're working on CERN lxplus system and interacting with its Openstack facility.
The scripts are:

  * `openstack-init.sh`: it creates the `~/.openrc` file that will be sourced by all the openstack-related scripts
  * `crabservervm-create.sh`: to create your crab VM (nothing special, just quicker than web interface). Launch it from  `lxplus`
  * `crabserver-install-part1.sh`: launch it from *inside* the VM. Reboot it at the end 
  * `crabserver-install-part2.sh`: launch it from *inside* the VM after `crabserver-install-part1.sh`. It creates a CRAB restful server
  * `crabservervm-rebuild.sh`: to rebuild a VM, rather then deleting it and creating it again (this will be longer do to DNS update process)


The typical workflow is:

  * `[lxplus]$ cd path/to/crab-testbed/`
  * `[lxplus]$ ./crabserver-create.sh my-crab-server 'SLC6 CERN Server - x86_64 [2015-02-10]'`
  * wait until you can ssh to the VM
  * `[lxplus]$ ssh my-crab-server`
  * `[my-crab-server]$ cd path/to/crab-testbed`
  * `[my-crab-server]$ ./crabserver-install-part1.sh`
  * `[my-crab-server]$ sudo reboot`
  * `[my-crab-server]$ ./crabserver-install-part2.sh`
