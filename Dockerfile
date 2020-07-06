# Container image that runs your code
#FROM alpine:3.10
FROM ubuntu:18.04

#RUN apk add python3 git gcc gfortran

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

COPY validate_version.py /validate_version.py

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
