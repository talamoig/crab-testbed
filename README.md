# Crab Server Installation Scripts

This repo contains scripts to build a CRAB 3 development testbed, assuming you're working on CERN lxplus system and interacting with the Openstack facility.

The scripts are:

  * `openstack-init.sh`: it creates the `~/.openrc` file that will be sourced by all the openstack-related scripts
  * `crabservervm-create.sh`: to create a VM (nothing special, just quicker than web interface and configured with suggested size). Launch it from  `lxplus`
  * `crabserver-install-part1.sh`: launch it from *inside* the VM. Reboot it at the end 
  * `crabserver-install-part2.sh`: launch it from *inside* the VM after `crabserver-install-part1.sh`. It creates a CRAB restful server
  * `crabservervm-rebuild.sh`: to rebuild a VM, rather then deleting it and creating it again (this will be longer due to DNS update process)

The typical workflow of the first time you use this script collection is:
  * `git clone https://github.com/talamoig/crab-testbed # in an area that will be accessible by your VMs later on, eg. on afs`
  * `cd crab-testbed/`
  * `cp paramsrc.sample paramsrc`
  * customize `paramsrc` (read below)
  * `./crabservervm-create.sh my-crab-server 'SLC6 CERN Server - x86_64 [2015-02-10]'`
  *  wait until you can ssh to the VM (you can run `./waitvm-then-ssh.sh my-crab-server`)
  * `ssh my-crab-server` (not if you logged using the previous script)
  * `cd path/to/crab-testbed`
  * `./crabserver-install-part1.sh # at the end will reboot automatically`
  * `ssh my-crab-server`
  * `./crabserver-install-part2.sh`

During `crabserver-install-part2.sh` the configuration file `paramsrc` is used where shell-variable have to be defined. The paramaters are:

  * `ORACLEUSER`: your oracle user
  * `ORACLEPASS`: your oracle password
  * `GITUSER`: your github user account
  * `INITDB`: if defined the oracle database will be initialized. Necessary only the first time
  * `HGVER`: version of the crab server. It is an optional parameter. If it is not configured, the last one will be used (you can obtain it with `git tag -l 'HG*'|tail -1` in the git repository `git://github.com/dmwm/deployment.git`)
  * `REST_HOSTNAME`: hostname of the RESTful CRAB3 interface, aka Crab Server
  * `TW_HOSTNAME`: hostname of the Task Worker. if not defined REST_HOSTNAME will be used instead
  * `GISTEXTURL`: (eg. `https://gist.githubusercontent.com/talamoig/a46f05a991df431febb2/raw/gistfile1.txt`) If you don't provide it, a suggestion
of its content will be printed, according to the other parameters

Consider that you should have:

  * a oracle account;
  *  `CRABServer` and `WMCore` repositories forked on your account.
