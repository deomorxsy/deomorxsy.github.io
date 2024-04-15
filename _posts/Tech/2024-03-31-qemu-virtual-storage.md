## Virtual Storage for QEMU

quick notes about the different ways to handle storage virtualization for QEMU

### 0. mknod
> \[31/03/2024 10:07]
mknod can be used for creating block or character special files, such asdevice nodes (special directories). It is an alternative for the powerful dd command which could wipe your root system at runtime.



### 1. sparse file with dd

```sh
dd if=/dev/zero of=./utils/storage/kernel-hd bs=1M count=2048
mkfs.ext4 ./utils/storage/kernel-hd
```
then you boot qemu with this, passing as ```-drive file=./utils/storage/kernel-hd,format=raw```

### 2. qcow2 format
```sh
qemu-img create -f qcow2 disk.qcow2 1G
```

### 3. file allocation with fallocate
allocating a new file of size 100M by doing the command below. Then format the disk using whatever, like fdisk or mkfs from the step 1.
```sh
fallocate -l100M image
```

### 4. libguestfs' guestmount
> \[03/04/2024 22:15]
guestmount has as dependency libguestfs.
```sh
sudo pacman -S libguestfs
```
now mount the qcow2 image using the "-i" flag
```sh
guestmount -a path_to_image.qcow2 -i --ro /mount_point
```

### 5. nbd (Network Block Device)
"With nbd compiled in the kernel (or as a module), Linux can use a remote server as one of its block devices. So every time the client computer wants to read, e.g., /dev/nb0, it sends a request over TCP to the server, which will reply with the data read. This can be used for stations with low disk space (or even diskless) to borrow disk space from another computer. Unlike NFS, it is possible to put any filesystem on it, etc." [source](https://docs.kernel.org/admin-guide/blockdev/nbd.html)

the problem is that if nbd wasn't compiled on the kernel, you would have to use the kernel module version, which would taint your kernel. Not really a problem in a controlled environment.

for how to mount, check this [gist](https://gist.github.com/shamil/62935d9b456a6f9877b5) or this [unix exchange](https://unix.stackexchange.com/a/598265/358160) answer.
