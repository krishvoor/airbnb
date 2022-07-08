#!/usr/bin/env bash

# Change ownership
cd /install/ 
chown -R mongodb:mongodb /install/
chmod 777 -R /install/
usermod -s /bin/bash mongodb
chown -R `whoami`:`whoami` /data/db/
chmod -R 777 /data/db/