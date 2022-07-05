FROM docker.io/mongo:latest

RUN apt update \
#    && apt install nodejs -y \
#    && apt install npm -y \
    && apt install wget -y


# Download & unpack datasets
RUN mkdir -p /tmp/data/ \
    && cd /tmp/data/ \
    && wget -O /tmp/data/listings.csv.gz http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-06-05/data/listings.csv.gz \
    && wget -O /tmp/data/calendar.csv.gz http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-06-05/data/calendar.csv.gz \
    && wget -O /tmp/data/reviews.csv.gz http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-06-05/data/reviews.csv.gz \
    && gunzip listings.csv.gz \
    && gunzip calendar.csv.gz \
    && gunzip reviews.csv.gz

RUN mongod --fork --logpath /var/log/mongodb/mongod.log \
    && mongoimport --uri="mongodb://localhost:27017/airbnb" -c calendar --type csv --headerline --drop /tmp/data/calendar.csv \
    && mongoimport --uri="mongodb://localhost:27017/airbnb" -c listings --type csv --headerline --drop /tmp/data/listings.csv \
    &&  mongoimport --uri="mongodb://localhost:27017/airbnb" -c reviews --type csv --headerline --drop /tmp/data/reviews.csv

EXPOSE 27017
CMD ["mongod"]
