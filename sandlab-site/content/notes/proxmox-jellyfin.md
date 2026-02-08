+++
title = "Jellyfin Server"
description = "Overview of the steps to setup a Proxmox hypervisor with a Jellyfin LXC."
date = 2026-01-23
authors = ["Sandy"]
+++

Notes on how I set up a (Jellyfin Server)[https://jellyfin.org/] in a linux container (LXC) running on (Proxmox)[https://www.proxmox.com/en/].

A couple of useful links on setting up Jellyfin on an LXC container running on Proxmox.

* (Jellyfin proxmox forum)[https://forum.proxmox.com/threads/guide-jellyfin-remote-network-shares-hw-transcoding-with-intels-qsv-unprivileged-lxc.142639/]
* (Installing Jellyfin on Proxmox)[https://www.wundertech.net/installing-jellyfin-on-proxmox/]


## Setup

The main things to do are;

- Create an LXC container
- Install Jellyfin Server on LXC container
- Setup the intel iGPU passthrough for LXC container to use for transcoding
- Mount the NAS file shares for access to media for Jellyfin