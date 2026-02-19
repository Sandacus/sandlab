+++
title = "NFS for Jellyfin Server on LXC"
description = "Notes for setting up NFS from Open Media Vault for a Jellyfin server running on a Proxmox LXC."
date = 2026-02-18
+++

The simplest option for setting up an NFS share for a Jellyfin server running on Proxmox in an unprivileged LXC[^1] [^2].

Steps;

- Mount NFS to Proxmox host
- Persist by the NFS mount
- Pass through to LXC running Jellyfin

---

## Mount NFS to Proxmox host

Make sure `nfs` is installed.

```
$ apt install nfs-common
```

Create a directory for the NFS share to mount into.

```
$ mkdir /Jellyfin
```

Mount the NFS filestystem to the directory you created

```
$ mount <NFS ip address>:<NFS folder location> /Jellyfin
```

This might look something like

```
$ mount 192.168.1.100:/export/media /Jellyfin
```

Typically the NFS in OMV lives after an `/export', then comes the name of whatever folder is added to the NFS share.

---

## Persist the NFS mount

Update the `/etc/fstab` with the nfs mount so this persists if Proxmox is rebooted.
Add the following line to `/etc/fstab`

```
192.168.1.100:/export/media /Jellyfin nfs defaults 0 0 
```

---

## Pass NFS mount through to LXC

In the Jellyfin LXC, create a directory that will take the NFS mount.
For example;
```
lxc$ mkdir /media
```

Then back in the Proxmox main node, edit the LXC conf file where the Jellyfin server is running.
If the LXC is has an id of 100, then this would be; `/etc/pve/lxc/100.conf`.
Add the following line to this file.

```
mp0: /mnt/Jellyfin,mp=/media
```

Restart the LXC and you should be able to see the NFS files there.



[^1]: [Jellyfin proxmox forum](https://forum.proxmox.com/threads/guide-jellyfin-remote-network-shares-hw-transcoding-with-intels-qsv-unprivileged-lxc.142639/)
[^2]: [Installing Jellyfin on Proxmox](https://www.wundertech.net/installing-jellyfin-on-proxmox/)
