#!/bin/bash
sudo chroot  squashfs-root  dpkg-query -W --showformat='${Package} ${Version}\n' | sudo tee newiso/casper/filesystem.manifest
sudo rm newiso/live/filesystem.squashfs
sudo mksquashfs  squashfs-root    newiso/live/filesystem.squashfs -comp xz -b 1M -Xdict-size 1M
