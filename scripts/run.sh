#!/usr/bin/env bash

# Clean Up
rm -rf /var/log/mongodb/mongod.log

# Start the MongoDB deamon
mongod --bind_ip_all &

# Wait sometime for mongod to start
sleep 15

# Unpack the datasets
cd /install/
gunzip listings.csv.gz
gunzip calendar.csv.gz

# Import the datasets
cd /install/
mongoimport --uri="mongodb://0.0.0.0:27017/airbnb" -c listings --type csv --headerline --drop /install/listings.csv
mongoimport --uri="mongodb://0.0.0.0:27017/airbnb" -c calendar --type csv --headerline --drop /install/calendar.csv

# Run temp http-server
npm install http-server
./node_modules/.bin/http-server -p 8080