FROM ubuntu:18.10
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    python3-pip \
    python3-setuptools
COPY requirements.txt .
RUN pip3 install -r requirements.txt
ENTRYPOINT ["pre-commit"]
