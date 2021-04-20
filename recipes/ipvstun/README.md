# ipvstun recipe

This recipe idempotently sets up prerequisites for configuring
LVS in TUN mode.

After running everything we end up with two servers we can ssh
into (see hosts).

Let us come up with a VIP and keep track of the IPs

vip 10.27.0.99
dip 10.27.0.103
rip 192.168.88.251

Realserver:

```
echo 1 > /proc/sys/net/ipv4/conf/ens3/arp_ignore
echo 2 > /proc/sys/net/ipv4/conf/ens3/arp_announce
ifconfig tunl0 10.27.0.99 netmask 255.255.255.255 broadcast 10.27.0.99 up
echo 0 > /proc/sys/net/ipv4/conf/tunl0/rp_filter
```

Director:

```
ifconfig ens3:0 10.27.0.99 netmask 255.255.255.255 broadcast 10.27.0.99 up
ifconfig tunl0 0.0.0.0 up
ipvsadm -A -t 10.27.0.99:80 -s rr
ipvsadm -a -t 10.27.0.99:80 -r 192.168.88.251 -i
```
