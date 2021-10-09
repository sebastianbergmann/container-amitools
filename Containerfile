FROM ubuntu:21.10

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
    git clone --depth 1 https://github.com/cnvogelg/amitools.git && \
    cd /root/amitools && \
    python3 setup.py install && \
    cd / && \
    rm -rf /root/amitools && \
    apt-get purge -y \
        git && \
    apt-get -y autoremove

