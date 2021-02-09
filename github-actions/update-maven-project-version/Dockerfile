FROM frolvlad/alpine-bash:latest

# Need root to write
USER root

# Repository gets mounted to this directory
WORKDIR /github/workspace

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]