cat <<EOF > hosts
[director]
$(unraid-kvm-getaddr director)

[web]
$(unraid-kvm-getaddr realservertun)
EOF
