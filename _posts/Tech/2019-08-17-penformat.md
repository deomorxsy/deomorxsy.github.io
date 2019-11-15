---
layout: blog-posts
title: "Pendrive Formatting by the CLI"
date: 2019-08-17 20:52:40
categories: tech
tags:
---

1. detecting the pendrive:

```bash
sudo fdisk -l
```
2. unmounting pendrive

```bash
sudo umount /dev/sdf1
```

3. formatting the pendrive

```bash
sudo mkfs.vfat -n ‘Nome Pendrive’ -I /dev/sdf1
```

where:

- '-n' = Volume Name
- 'mkfs' = command responsible for format the file system
- 'vfat' = formats in the file system FAT. Others avaible: mkfs.bfs, mkfs.ext2, mkfs.ext3, mkfs.ext4, mkfs.minix, mkfs.msdos, mkfs.vfat, mkfs.xfs, mkfs.xiafs.
- '-I' = pen drive's partition


