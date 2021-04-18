# unraid-from-arch

These scripts are designed to be run on an archlinux computer
and meant to target an unraid system particularly for VM labs
by using cloud-init. It assumes you have two shares:

isos
domains

Domains comes with unraid and is where the virtual machines are built.
This is not exported by default, so you want to do that.
Isos is something I made and is where I store my isos. In this case,
we are leveraging ubuntu 20.04/focal cloud-init images, available here:

https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img

Before you can use this, you'll need something like this in your bashrc

```
UNRAID_TOOLS="/home/keyvan/unraid"
OTHER_PATHS="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export PATH="$UNRAID_TOOLS/bin:$OTHER_PATHS"
export UNRAID_SMB_CREDS_FILE=/home/keyvan/unraid/.smb-creds
export UNRAID_HOST=davinci
export UNRAID_SHARES_ROOT=$UNRAID_TOOLS/mnt
export UNRAID_KVM_CREATEVM_DEFAULT_PASSWORD=myPa55!
```

The `.smb-creds` file looks something like this:

```
username=your-username
password=your-plaintext-pw
domain=WORKGROUP
```

## note about netcat dependency

It appears that using qemu+ssh:// method of accessing unraid's libvirtd requires
a copy of netcat on the unraid side. A quick fix is transferring your own copy:

```
scp /usr/bin/nc $UNRAID_HOST:/usr/bin/nc
virsh --connect qemu+ssh://$UNRAID_HOST/system
```
