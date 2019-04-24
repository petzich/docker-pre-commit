FROM ubuntu:18.10
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git \
    python3-pip \
    python3-setuptools \
    && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
ENTRYPOINT ["pre-commit"]
