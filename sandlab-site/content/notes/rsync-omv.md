+++
title = "RSync on OMV"
description = "Setup a job to copy the media files from one SSD to another SSD on OpenMediaVault"
date = 2026-02-15
draft = true
+++

## Task 

Copy the media files from one SSD to another SSD on OpenMediaVault (OMV) server. 

### Overview

I want to set up an RSync job to copy across media files from one SSD to another.
This will let me set up a second share using NFS that will be used for passing media files to my Jellyfin server.
Setting up multiple shares linking to the same drive looks to be a very bad idea, so a second drive with a mirror of the data used by the SMB is the way to go.
This has the benefit of making a copy of the data.

> Note: this is not full backup strategy!

### Background

Currently the NAS has an SMB share set up for the local network that is used for adding media files to from a computer on the network. 
I have a Jellyfin server set up on in a Proxmox LXC and the options for sharing the NAS media files with this seem to be;

1. SMB share mount to Proxmox host using `uid` or `gid` mappings
2. NFS share passed directly to the LXC running the Jellyfin server

From doing a bit of research[^1], I think the best practice is to pass an NFS share directly to the LXC running the Jellyfin server.

[^1] This article [Why Mounting SMB on Proxmox might be your biggest mistake](https://medium.com/@PlanB./why-mounting-smb-on-proxmox-might-be-your-next-big-mistake-98d35c70b16d) suggests this the most secure/best practice.

The main reasons for this are the the direct passthrough of NFS is more secure, i.e., reduces the potential "blast" radius, and the consensus seems to be that NFS is a better transfer protocol (more stable, more secure) than SMB.

___

## Todo

- RSync command to copy data from SSD1 to SSD2
    - Don't duplicate data
    - Don't delete anything, just copy in
- Schedule this RSync command to run once a day to automate this

## RSync setup

- OMV wiki has this helpful article [Full Disk Mirroring Backup with RSync](https://wiki.omv-extras.org/doku.php?id=omv6:utilities_maint_backup#full_disk_mirroring_backup_with_rsync).
- Main [RSync website](https://rsync.samba.org/)
- University of Washington article on [RSync](https://depts.washington.edu/sociolab/labmembers/documents/rsync-handout.pdf)

Find the RSync mount points for the OMV drives.
On OMV -> Storage -> File Systems. Then click the table icon in the top right of the screen and select "Mount Point". 
The mount points are then visible to use in RSync.

{{ image(path="/images/omv-mount-point.png") }}

Then the RSync command

```
rsync -av /src/dev-disk-by-uuid-<uuid-source>/ /src/dev-disk-by-uuid-<uuid-destination>/
```

However on OMV 8, the RSync task scheduling is handled by a GUI where you can select the source and destinations drives.
Got to OMV -> Services -> RSync -> Tasks. Click the "+" icon to create a new task.

{{ image(path="/images/rsync-add-task.png") }}

The interface allows creation of a schedule for various times, or you can disable it and just run it manually as desired.

{{ image(path="/images/rsync-task-setup.png") }}
