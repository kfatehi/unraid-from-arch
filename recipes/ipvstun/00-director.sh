#!/bin/bash

# director will sit on 10.27 network
# it will be given the vip 10.27.0.99
# it will have an IP given by DHCP

export UNRAID_KVM_BRIDGE=br0
export UNRAID_KVM_NETWORK=10.27.0.0/24
export UNRAID_KVM_INTERFACE=enp6s0f1
export DOMAIN=director

unraid-kvm-ensurevm $DOMAIN
unraid-kvm-getaddr $DOMAIN
