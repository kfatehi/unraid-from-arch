#!/bin/bash
export SSH_OPTS="-t"
unraid-kvm-ssh ruby211 "curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash --login"
unraid-kvm-ssh ruby211 "echo 'export PATH=\"\$HOME/.rbenv/bin:\$PATH\"' >> ~/.bash_profile"
unraid-kvm-ssh ruby211 "echo 'eval \"\$(rbenv init -)\"' >> ~/.bash_profile"
unraid-kvm-ssh ruby211 "curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash --login"

