# Altocumulus

**IMPORTANT** This is a proof of concept, it might not even work for your deployment. I'm planning on refactoring this to use the Neutron agent framework as well as Neutron RPC.

Integrate your Cumulus Linux switch with OpenStack Neutron

Manages VLAN bridges on the switch and L2 connectivity between (compute) hosts and the VLAN bridges. Uses LLDP to perform auto-discovery of hosts and the switchports they are connected to.

Uses the same conventions as the Linux Bridge agent so that DHCP/L3 agents can theoretically be hosted on the switch.

This branch includes changes conducted by Ceng to understand strengths and
weakness of plugin for future development and improvement.

## Usage

There are two components involved in this project:

* ML2 mechanism driver (runs on hosts with Neutron server)
* HTTP API server (runs on switches)

## Requirements
  Openstack Kilo Release. Does not work with Juno or Older releases
  LLDP must be active on all compute nodes and switches.

## Supported Topology
  Singly attached server to a switch, with single or bond L2 links between
switches.

## Installation

### ML2 mechanism driver

#### Redhat Openstack

```bash
# yum install git rpm-build
# ps -ef | grep neutron-server # confirm neutron server is running on this otherwise find the right server
#  git clone http://github.com/CumulusNetworks/altocumulus
# cd altocumulus
# python setup.py bdist_rpm
# rpm -ivh dist/altocumulus-0.1.0.dev13-1.noarch.rpm

```
(maybe just include this rpm to the branch? easier..maybe?

2. Add `cumulus` to the `mechanism_drivers` field in `/etc/neutron/plugins/ml2/ml2_conf.ini`
3. Copy the sample ml2_cumulus_ini in this repo to  `/etc/neutron/plugins/ml2/ml2_cumulus.ini` on the network node.

### HTTP API server

_Working on building a deb_ and will add to this branch

## To-do

* Authentication
* Pluggable discovery strategies
* Integration with `oslo.rootwrap` for unprivileged operation
* Working upstart script
