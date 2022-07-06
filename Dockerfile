FROM docker.io/mongo:latest

RUN apt-get update \
    && apt-get install npm -y

# Staging area
COPY downloads /install/
COPY run.sh /install/

EXPOSE 8080
ENTRYPOINT  ["/bin/bash","-c","/install/run.sh"]