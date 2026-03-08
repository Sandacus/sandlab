+++
title = "Backups"
description = "Looking into backup strategy for homelab data"
date = 2026-03-08
+++

I need a backup strategy.
The simplest and least robust would be to simply mirror the data drives with RSync.
After some research, *restic* seems to be a good option for creating a more robust backup that can use snapshots to give historical copies.

Given the 3-2-1 rule for backups;

* 3 copies
* 2 different mediums
* 1 offsite copy

Then the local restic backup would achieve 1 of the 3 copies.
So, I still need 2 more copies, one of which is off-site.
A cloud backup solution seems like a good idea, since it would check another copy and also count as the second medium of storage.
Some options for cloud storage;

* [Backblaze](https://www.backblaze.com/cloud-backup/pricing)
* [AWS Glacier](https://aws.amazon.com/s3/pricing/)
* [Google Cloud Storage](https://cloud.google.com/storage#pricing)
* [Sync.com](https://www.sync.com/pricing-individual/)

I think Backblaze seems like the best price for storing multiple TBs of data.

That's 2 copies and 2 different mediums sorted. 
Just 1 more copy to go. 
I think perhaps for simplicity a mirror of the data drives, using RSync.

---

## Backup plan

* **Copy 1:** Local HDD, backed up using restic with snapshots 
* **Copy 2:** Cloud Storage, Backblaze
* **Copy 3:** Local Mirror HDD, RSync for copying latest data 

## Todo list

* [ ] **Copy 1:** Local HDD, backed up using restic with snapshots 
  * [ ] Get backup drive
  * [ ] Format and add to NAS
  * [ ] Configure restic backups
  * [ ] Test it works
* [ ] **Copy 2:** Cloud Storage, Backblaze
  * [ ] Setup Backblaze account
  * [ ] Choose plan
  * [ ] Setup the backup
  * [ ] Test it works
* [ ] **Copy 3:** Local Mirror HDD, RSync for copying latest data 
  * [ ] Get backup drive
  * [ ] Format and add to NAS
  * [ ] Configure RSync job
  * [ ] Test it works