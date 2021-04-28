#!/bin/bash
DOMAIN=ruby211
SCRIPT=_compile-openssl.sh
IP=$(unraid-kvm-getaddr $DOMAIN)
scp $SCRIPT ubuntu@$IP:$SCRIPT
ssh ubuntu@$IP sudo bash /home/ubuntu/$SCRIPT
