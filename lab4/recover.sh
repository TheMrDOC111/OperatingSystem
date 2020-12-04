#!/usr/bin/bash
# Lab 4 - Network Configuration and Troubleshooting

if [ "$(whoami)" != "root" ]; then
echo "You must be a root" && exit 0
fi
# Who am I? (user_name=$SUDO_USER)
for user in `ls /home` ; do
if [ $user != "lost+found" ]; then
user_name=$user
fi
done

# Find backup folder
backup_dir=/home/$user_name/.backup

# Revert changes with files
chattr -i $backup_dir/*
chmod ugo+rw $backup_dir/*


# Recover config files from backup
cp $backup_dir/network /etc/sysconfig/
cp $backup_dir/resolv.conf /etc/

for config in `ls $backup_dir/ifcfg-*`; do
cp $config /etc/sysconfig/network-scripts/
done

# Remove bad script
chattr -i .netcfg.sh
chmod ugo+rw .netcfg.sh

# Restart network service
systemctl restart NetworkManager.service

