#!/bin/bash

unraid_net_27
export DOMAIN=ruby211

unraid-kvm-ensurevm $DOMAIN

unraid-kvm-ssh $DOMAIN sudo timedatectl set-timezone America/Los_Angeles

unraid-kvm-ssh $DOMAIN sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev


# you might get some SSL problem when trying to connect to rubygems server, read here:
# https://bundler.io/guides/rubygems_tls_ssl_troubleshooting_guide.html#automated-ssl-check
# the solution is to install the latest cert
# https://raw.githubusercontent.com/rubygems/rubygems/master/lib/rubygems/ssl_certs/rubygems.org/GlobalSignRootCA_R3.pem
# and then you can force it to be used like so:
# export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem
# but this is a hack, we take care of it in a better way later in the recipe


