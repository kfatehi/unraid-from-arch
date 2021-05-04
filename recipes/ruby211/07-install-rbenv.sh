#!/bin/bash
export SSH_OPTS="-t"
DOMAIN="${DOMAIN:-ruby211}" 
unraid-kvm-ssh $DOMAIN "curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash --login"
unraid-kvm-ssh $DOMAIN "echo 'export PATH=\"\$HOME/.rbenv/bin:\$PATH\"' >> ~/.bash_profile"
unraid-kvm-ssh $DOMAIN "echo 'eval \"\$(rbenv init -)\"' >> ~/.bash_profile"
unraid-kvm-ssh $DOMAIN "curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash --login"

