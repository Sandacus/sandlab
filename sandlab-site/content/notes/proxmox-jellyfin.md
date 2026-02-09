+++
title = "Jellyfin Server"
description = "Overview of the steps to setup a Proxmox hypervisor with a Jellyfin LXC."
date = 2026-01-23
updated = 2026-02-09
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


## Setup

The main things to do are;

- Create an LXC container
- Install Jellyfin Server on LXC container
- Setup the intel iGPU passthrough for LXC container to use for transcoding
- Mount the NAS file shares for access to media for Jellyfin