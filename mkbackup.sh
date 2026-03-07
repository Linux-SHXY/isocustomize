#!/bin/bash
set -e  # 遇到错误退出

TARGET="${1:-squashfs-root}"  # 允许参数指定目标目录，默认为squashfs-root

# 检查是否以root运行
if [ "$EUID" -ne 0 ]; then
    echo "请以root权限运行此脚本" >&2
    exit 1
fi

# 创建目标目录
mkdir -p "$TARGET"

# 定义排除列表
EXCLUDES=(
    "--exclude=/home"
    "--exclude=/etc/machine-id"
    "--exclude=/var/lib/dbus/machine-id"
    "--exclude=/etc/NetworkManager/system-connections"
    "--exclude=/etc/wpa_supplicant/wpa_supplicant.conf"  # 可能需要排除具体文件或目录
    "--exclude=/etc/wpa_supplicant/*.conf"
    "--exclude=/tmp"
    "--exclude=/var/tmp"
    "--exclude=/var/cache"
    "--exclude=/var/log"
    "--exclude=/var/run"  # 通常指向/run
    "--exclude=/run"
    "--exclude=/proc"
    "--exclude=/sys"
    "--exclude=/dev"
    "--exclude=/lost+found"
    "--exclude=/media"
    "--exclude=/mnt"
    "--exclude=/swapfile"
    "--exclude=/home/*/.cache"  # 可选
    "--exclude=/root/.cache"
)

# 执行rsync
rsync -a --delete "${EXCLUDES[@]}" / "$TARGET"

echo "同步完成到 $TARGET"
