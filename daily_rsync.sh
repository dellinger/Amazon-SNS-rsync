#!/bin/bash

#Explain arguments that can be passed in
argumentUsage(){
	cat << EOF
	usage: $0 options

	This script configures rsync to backup SOURCE to DESTINATION and provide notifications on status.

	OPTIONS:
	   -h    Show this message
	   -s    Source location
	   -d    Destination location
EOF
}

DESTINATION=
SOURCE=

while getopts "hs:d:" OPTION
do 
   case $OPTION in
   	h)
       argumentUsage
       exit
       ;;
    s)
       SOURCE=$OPTARG
       ;;
    d)
	   DESTINATION=$OPTARG
	   ;;
	?)
	   argumentUsage
	   exit
	   ;;
   esac
done

if [ -z "$SOURCE" ] 
then
	argumentUsage
	exit
fi
if [ -z "$DESTINATION" ] 
then
	argumentUsage
	exit
fi

DATE=`date +%Y-%m-%d`
DESTINATION="${DESTINATION}$DATE"
mkdir -p $DESTINATION

rsync -avh $SOURCE $DESTINATION