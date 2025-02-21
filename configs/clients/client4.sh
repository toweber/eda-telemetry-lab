#!/bin/bash
ip link add bond0 type bond mode 802.3ad xmit_hash_policy layer3+4
ip link set addr 00:c1:ab:01:01:04 dev bond0
ip link set eth1 down
ip link set eth2 down
ip link set eth1 master bond0
ip link set eth2 master bond0
ip link set eth1 up
ip link set eth2 up
ip link set bond0 up
ip link add link bond0 name bond0.1001 type vlan id 1001
ip link add link bond0 name bond0.202 type vlan id 202
ip link set bond0.1001 up
ip link set bond0.202 up
ip addr add 10.10.10.4/24 dev bond0.1001
ip addr add 10.20.2.4/24 dev bond0.202