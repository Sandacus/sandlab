+++
title = "Media Ripping"
description = "Notes on how to rip DVDs and Blur-rays."
date = 2026-02-28
+++

The main tool used is [MakeMKV](https://www.makemkv.com/).
It is free to download, but for ripping blur-rays you need a licence, which can be purchased for $50 for a lifetime licence.
For ripping UHD Blu-rays, i.e., 4K films, you will need a drive that has the correct firmware installed.

At its core, this is a pretty simple workflow with only 2 main steps.

1. Use MakeMKV software to rip media to an .mkv file
2. Copy this .mkv file to wherever you store your media

---

## Current workflow

For my current workflow, I have 2 drives setup on my NAS.
Drive one is an SMB share drive that has read/write permissions for computers on the local network.
The second drive is set up with an NFS share for read only permission attached to the Proxmox host and passed through to the Jellyfin LXC server.
So the steps for adding media to my media library are;

1. Use MakeMKV to rip the film or show to the SMB file share
2. Use RSync tothe copy of media from the SMB drive to the NFS drive
3. **TODO:** Setup a backup job to backup the media to a backup drive

---

## Another useful tool

Another useful tool to be aware of is [Handbrake](https://handbrake.fr/) video transcoder.
From Handbrake's docs; *...Its primary purpose is to convert videos from supported source formats .MP4 .MKV or .WebM formats..."*.
This can be useful if storage capacity is limited. 
MKV files are big.
A 2 hour DVD is around 6GB, the equivalent Bluray is around 30GB, and the UHD 4K version are 60GB and more!
So, Handbrake is a tool that can take the source MKV file and convert it so a smaller MP4 file.
I'm going to stick with MKV for now, but something to consider.