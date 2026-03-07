#!/bin/bash
sudo unsquashfs newiso/live/filesystem.squashfs
sudo cp /etc/resolv.conf    squashfs-root/etc
sudo  chroot  squashfs-root
