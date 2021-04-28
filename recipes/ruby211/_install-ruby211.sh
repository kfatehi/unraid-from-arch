#!/bin/bash
RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/openssl-1.0" rbenv install 2.1.1
rbenv global 2.1.1
rbenv shell 2.1.1
# before we can use gem to grab bundler, we need to update the cert...

curl -sSL https://raw.githubusercontent.com/rubygems/rubygems/master/lib/rubygems/ssl_certs/rubygems.org/GlobalSignRootCA_R3.pem > ~/.rbenv/versions/2.1.1/lib/ruby/2.1.0/rubygems/ssl_certs/GeoTrustGlobalCA.pem

# now we can install the compatible bundler version
gem install bundler -v 1.17.2

# we need to give bundler the proper certificate too
cat ~/.rbenv/versions/2.1.1/lib/ruby/2.1.0/rubygems/ssl_certs/GeoTrustGlobalCA.pem > ~/.rbenv/versions/2.1.1/lib/ruby/gems/2.1.0/gems/bundler-1.17.2/lib/bundler/ssl_certs/index.rubygems.org/GlobalSignRootCA.pem

# should be good to go now to run your older apps
echo "congrats, you have come out the other side of a time machine, in the present!"
