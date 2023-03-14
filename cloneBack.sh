#!/bin/bash
# backup.sh
timestamp=$(date +%d-%b-%y-%I:%M)
echo $timestamp
backupstamp="backup.$timestamp"
echo $backupstamp
source="/dev/nvme0n1"
echo $source
## Prompt: gzip to Images or clone to sdb? (gz/cl)
## If cl
destination="/dev/sdb"
echo $destination
sudo dd if=$source of=$destination bs=16M status=progress

######### RECOVERY ###########
# Stop panicking, just reverse the clone
####### (you'll need sudo) dd if=$destination of=$source bs=18M status=progress
 
