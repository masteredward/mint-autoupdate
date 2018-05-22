#!/bin/bash

INSTALL_DIR=/opt/autoupdate
SYSTEMD_DIR=/etc/systemd/system

if [ $EUID != 0 ]
then
    echo "Not running as root!!! Aborted!"
    exit
fi

mkdir $INSTALL_DIR
cp autoupdate.sh $INSTALL_DIR
touch $INSTALL_DIR/autoupdate.log
chown root. $INSTALL_DIR/autoupdate.*
chmod 744 $INSTALL_DIR/autoupdate.sh
cp autoupdate.service $SYSTEMD_DIR
chown root. $SYSTEMD_DIR/autoupdate.service
systemctl enable autoupdate.service
systemctl start autoupdate.service
echo "Installed!!!"
