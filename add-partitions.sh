#!/bin/bash

# Check for root privileges
if [ "$(id -u)" -ne 0 ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Check input arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <device> <home_mount_point>"
    exit 1
fi

DEVICE=$1
HOME_MOUNT_POINT=$2

# Partition the disk
parted -s $DEVICE mklabel gpt -- \
    mkpart primary ext4 1MiB 50GiB \
    mkpart primary fat32 50GiB 52GiB \
    mkpart primary linux-swap 52GiB 72GiB \
    mkpart primary ext4 72GiB 100%

# Wait for the kernel to recognize new partitions
sleep 2

# Making filesystems
mkfs.vfat -F32 ${DEVICE}2
mkfs.ext4 ${DEVICE}1
mkswap ${DEVICE}3
swapon ${DEVICE}3
mkfs.ext4 ${DEVICE}4

# Mounting
mkdir -p ${HOME_MOUNT_POINT}
mount ${DEVICE}4 ${HOME_MOUNT_POINT}

echo "Partitioning and mounting completed successfully."

