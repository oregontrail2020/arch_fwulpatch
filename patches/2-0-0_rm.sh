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
PDIR=${0%/*}

ME=$(id -u)
[ $ME -ne 0 ] && echo "ERROR you need to run this script as root" && exit

echo 20
rm -vf ${PDIR}/2-2*.sh 2>&1 >> $LOG

echo 100

F_LOG "patch applied"

