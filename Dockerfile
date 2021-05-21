FROM ubuntu:21.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
        git \
        python3 \
        python3-setuptools \
        python3-pip && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install cython && \
    cd /root && \
    git clone https://github.com/cnvogelg/amitools.git && \
    cd /root/amitools && \
    git checkout -qf da54c9fdc26cc3aedf98efa88fcfc9c42bc719a1 && \
    python3 setup.py install && \
    cd / && \
    rm -rf /root/amitools && \
    apt-get purge -y \
        git && \
    apt-get -y autoremove

