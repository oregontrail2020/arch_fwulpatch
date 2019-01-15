#!/bin/bash - 
########################################################################################
#
# HOTFIX FOR FWUL PERSISTENT
#
########################################################################################

# include and setup
source /var/lib/fwul/generic.vars && source $GENFUNC
[ $? -ne 0 ] && echo "ERROR Cant include required lib" && exit
BIN=${0##*/}
LOG=$LOGPATH/${BIN/sh/log}

ME=$(id -u)
[ $ME -ne 0 ] && echo "ERROR you need to run this script as root" && exit

echo 20
wget http://leech.binbash.it:8008/FWUL/.repo/fwulpatch.pkg.tar.xz -O /tmp/fwulpatch.pkg.tar.xz 

echo 50
pacman -U --noconfirm /tmp/fwulpatch.pkg.tar.xz 2>&1 >> $LOG && rm -vf /tmp/fwulpatch.pkg.tar.xz 2>&1 >> $LOG

echo 60

yad --fixed --height=200 --width=400 --title="FLU updated" --text "\n   FWUL LivePatcher updated!!\n   Please close, re-open and click\n\n   \"Check &amp; Download Patches\"\n\n   again." --button=Close

# increase version
F_UPDVER "3.0" "1"
echo 100

F_LOG "patch applied"

