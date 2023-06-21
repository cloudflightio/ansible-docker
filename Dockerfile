FROM docker.io/library/ubuntu:22.04

RUN \
    apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        curl \
        apt-transport-https \
        lsb-release \
        gnupg \
        software-properties-common \
    && add-apt-repository --yes --update ppa:ansible/ansible \
    && rm -rf /var/lib/apt/lists/*

RUN \
    apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ansible \
        python3-pip \
        python-is-python3 \
    && rm -rf /var/lib/apt/lists/*

RUN \
    pip install \
        openshift \
        pyyaml \
        kubernetes

RUN \
    curl -L https://github.com/okd-project/okd/releases/download/4.13.0-0.okd-2023-06-04-080300/openshift-client-linux-4.13.0-0.okd-2023-06-04-080300.tar.gz --output openshift-client-linux.tar.gz && \
    tar -xvf openshift-client-linux.tar.gz && \
    mv oc kubectl /usr/local/bin/ && \
    chmod +x /usr/local/bin/oc && \
    chmod +x /usr/local/bin/kubectl
