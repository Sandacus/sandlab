+++
title = "NFS share on OMV"
description = "Setting up and an NFS share on Open Media Vault"
date = 2026-02-16
+++

To set up an NFS share on Open Media Vault (OMV);

> Prerequisites: You have a storage device with a file system you can use for the NFS share, e.g. Ext4.

- [OMV docs for NFS](https://docs.openmediavault.org/en/8.x/administration/services/nfs.html)
- head to OMV web interface
- Services -> NFS -> Settings; then click enabled, save and apply changes

    > Warning: If you don't do this step you will spend an embarrasing amount of time trying to figure out why you can't mount your NFS share 😅... I assume... definitely didn't happen to me. 

- Services -> NFS -> Shares; create with + button
  - name the share
  - choose the file system you already made (make sure your filesystem is compatible with NFS)
  - select the client ip address that can access the share, this can be a specific IP address or, you can set it so any device on the local network can access the NFS share with `192.168.1.0/24`
  - Set permission; I'm using READ only since this will be used for a Jellyfin server to get media files
  - Some extra options can be configured, I left the default ones, [nfs man page](https://manpages.debian.org/trixie/nfs-kernel-server/exports.5.en.html#General_Options) for more info
  - Give it a helpful tag
  - Save and apply

Now that's all done, the share is ready for the client. 
