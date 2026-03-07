#!/bin/bash
sudo mkdir  oldiso    newiso
sudo mount  linux.iso  oldiso  -o  loop 
sudo  cp  oldiso/*    newiso/      -rp
sudo  umount  oldiso

