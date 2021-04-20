#!/bin/bash

# the realserver will sit on the 192.168.88.0 segment
# it will have a rip provided by DHCP
# it will connect to the director by ipip tunl0
# it will be given the vip 10.27.0.99 via tunl0
export UNRAID_KVM_BRIDGE=br2
export UNRAID_KVM_NETWORK=192.168.88.0/24
export UNRAID_KVM_INTERFACE=enp6s0f0
export DOMAIN=realservertun

unraid-kvm-ensurevm $DOMAIN
unraid-kvm-getaddr $DOMAIN
