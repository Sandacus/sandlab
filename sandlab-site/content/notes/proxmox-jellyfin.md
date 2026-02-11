+++
title = "Jellyfin Server"
description = "Overview of the steps to setup a Proxmox hypervisor with a Jellyfin LXC."
date = 2026-01-23
updated = 2026-02-11
authors = ["Sandy"]
+++

Notes on how I set up a [Jellyfin Server](https://jellyfin.org/) in a linux container (LXC) running on [Proxmox](https://www.proxmox.com/en/).

A couple of useful links on setting up Jellyfin on an LXC container running on Proxmox.

* [Jellyfin proxmox forum](https://forum.proxmox.com/threads/guide-jellyfin-remote-network-shares-hw-transcoding-with-intels-qsv-unprivileged-lxc.142639/)
* [Installing Jellyfin on Proxmox](https://www.wundertech.net/installing-jellyfin-on-proxmox/)

Another article for binding an SMB mount to an unpriviledged container.
* [Proxmox: Bind SMB Mount To Unprivileged LXC Container - The Easy Way](https://dev.to/oswllt/proxmox-bind-smb-mount-to-unprivileged-lxc-container-the-easy-way-3l4k)

An alternative for binding SMB mount using `uid`/`gid` mappings.
* [Proxmox docs: Unprivileged LXC containers](https://pve.proxmox.com/wiki/Unprivileged_LXC_containers)

A medium article discussing the security implications of different share types, namely NFS versus SMB.
* [Why Mounting SMB on Proxmox might be your biggest mistake](https://medium.com/@PlanB./why-mounting-smb-on-proxmox-might-be-your-next-big-mistake-98d35c70b16d)

___

## Setup

The main things to do are;

- Create an LXC container
- Install Jellyfin Server on LXC container
- Setup the intel iGPU passthrough for LXC container to use for transcoding
- Configure a share for the media files to be accessed from the NAS
- Setup the share with the Jellyfin server, consider 2 options;
    1. SMB share mount to Proxmox host (bad)
    2. NFS share passed directly to the LXC running the Jellyfin server (good)