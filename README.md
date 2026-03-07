# Linux 镜像打包和自定义工具

## 简介

这是Linux镜像的打包和自定义脚本, 目前用于定制优化版Linux, 还可以做可迁移的备份，有了这个工具, 就可以定制自己的Linux发行版了

### 使用方法

* 首先准备好livecd的iso镜像, 改名`linux.iso`

* 运行`extract.sh`就可以解压镜像

* 然后运行`unsquashfs.sh`解压squashfs文件

* 解压完毕后自动进入livecd的shell, 就可以自由定制了

* 定制完毕后, 运行

```shell
apt-get clean (Debian系统删除已下载安装的软件包)
rm -rf /var/cache/pacman/pkg/*(Arch系统删除已下载安装的软件包)
rm /etc/resolv.conf
umount /proc
```

最后按`ctrl+d`退出chroot

* 回到主系统后, 分别运行`mksquashfs.sh`, `mkiso.sh`, 就可以打包镜像了
* 如果做当前系统的备份，就运行`mkbackup.sh`将当前系统备份到`squashfs-root`目录，再运行 `mksquashfs.sh`, `mkiso.sh`即可

### 注意事项

* 本脚本只在Debian镜像中测试过, 还没有测试过其他发行版, 理论上原理都是一致的
* 备份封装前需要提前在主系统安装好一个安装工具，如calamares，或者chroot进去装
* 备份也要准备好一个已有Livecd镜像
* 确保initrd和vmlinuz在squashfs和iso里的一致，否则无法启动
* 大家有感兴趣的, 可以使用本脚本更新完善团队内的定制系统项目, 如优化版linux, manjaro lxqt等
