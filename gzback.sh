#!/bin/bash
# backup.sh
timestamp=$(date +%d-%b-%y-%I:%M)
echo $timestamp
backupstamp="backup.$timestamp"
echo $backupstamp
source="/dev/nvme0n1"
echo $source
destination="/media/jasen/Images/$backupstamp.img.gz"
echo $destination
sudo dd if=$source bs=16M status=progress | gzip -c > $destination

######### RECOVERY ###########
#gunzip -c /media/jasen/Images/{chosen backup}.img.gz || dd of+/dev/nvme0n1 bs=16M status=progress
