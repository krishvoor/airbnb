#!/usr/bin/env bash

# Change ownership
cd /install/ 
chown -R mongodb:mongodb /install/
chmod 777 -R /install/