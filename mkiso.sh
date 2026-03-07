#!/bin/bash
sudo -s <<EOF
(cd newiso && find . -type f -print0 | xargs -0 md5sum > md5sum.txt)
exit
EOF
xorriso -outdev yhbos-v6.1-amd64.iso -volid "sulet yhbos v6" -padding 0 -compliance no_emul_toc -map newiso/ / -chmod 0755 / -- -boot_image isolinux dir=/isolinux -boot_image isolinux system_area=isohdpfx.bin -boot_image any next -boot_image any efi_path=boot/grub/efi.img -boot_image isolinux partition_entry=gpt_basdat


