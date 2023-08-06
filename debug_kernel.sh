#!/bin/bash

BZIMG_PATH=/root/workspace/linux-5.3.7/arch/x86/boot/bzImage
INIT_RAM_FS_PATH=/root/workspace/busybox-1.31.0/initramfs.cpio.gz

qemu-system-x86_64 \
-s -S \
-kernel ${BZIMG_PATH} \
-initrd ${INIT_RAM_FS_PATH}  \
-nographic -append "nokaslr console=ttyS0"  \
-serial mon:stdio -device e1000,netdev=net0 \
-netdev user,id=net0,hostfwd=tcp::5555-:22
