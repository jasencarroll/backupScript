#!/bin/bash
# backup.sh
timestamp=$(date +%d-%b-%y-%I:%M)
echo $timestamp
backupstamp="backup.$timestamp"
echo $backupstamp
source="/dev/nvme0n1"
echo $source
## Prompt: gzip to Images or clone to sdb? (gz/cl)
## If gz:
destination="/media/jasen/Images/$backupstamp.img.gz"
echo $destination
sudo dd if=$source bs=16M status=progress | gzip -c > $destination
## If c;
## 	destination="/dev/sdb"
## 	echo $destination
## 	sudo dd if=$source of=$destination bs=16M status=progress
## else "I'm not picking for you, one more try or I'll quit"
## 	Prompt: gzip to Images or clone to sdb? (g/c)
## 	If gz:
## 		destination="/media/jasen/Images/$backupstamp.img.gz"
## 		echo $destination
## 		sudo dd if=$source bs=16M status=progress | gzip -c > $destination
## 	If cl
##		destination="/dev/sdb"
##		echo $destination
##		sudo dd if=$source of=$destination bs=16M status=progress
##	else 
##		return: "I QUIT!"

## Future Work
## How do I automate this?
### Successful start
### Every hour while building
### Every 8 hours afterwards
## How to save set number of backups and purge remaining before that time. 


######### RECOVERY ###########
#gunzip -c /media/jasen/Images/{chosen backup}.img.gz || dd of+/dev/nvme0n1 bs=16M status=progress
#or just reverse the clone
