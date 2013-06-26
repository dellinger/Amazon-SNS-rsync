#!/bin/bash
DESTINATION=/media/drobo/daily/`date + %F`
mkdir -p $DESTINATION

rsync -avh $SOURCE $DESTINATION