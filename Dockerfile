# The first bit is a basic file, which can be used for most projects
FROM ubuntu:18.10 AS base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-pip \
    python3-setuptools
COPY requirements.txt .
RUN pip3 install -r requirements.txt
ENTRYPOINT ["pre-commit"]
