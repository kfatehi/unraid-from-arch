#!/bin/bash
DOMAIN=ruby211
SCRIPT=_install-ruby211.sh
IP=$(unraid-kvm-getaddr $DOMAIN)
scp $SCRIPT ubuntu@$IP:$SCRIPT
export SSH_OPTS="-t"
ssh ubuntu@$IP bash --login /home/ubuntu/$SCRIPT
