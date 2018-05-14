#!/bin/bash

LEVELS=12345
LOG_FILE=/opt/autoupdate/autoupdate.log

echo "----------------------------" >> $LOG_FILE
date >> $LOG_FILE
echo "----------------------------" >> $LOG_FILE
mintupdate-tool update -l $LEVELS >> $LOG_FILE
sleep 1m
mintupdate-tool upgrade -y -l $LEVELS >> $LOG_FILE
echo "----------------------------" >> $LOG_FILE
echo "" >> $LOG_FILE
