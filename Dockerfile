FROM docker.io/mongo:latest

RUN apt-get update \
    && apt-get install npm -y

WORKDIR /install/

# Staging area
COPY scripts /install/

# Update permissions
RUN /install/fix_perm.sh

# Switch user
USER mongodb

EXPOSE 8080
ENTRYPOINT  ["/bin/bash","-c","/install/run.sh"]