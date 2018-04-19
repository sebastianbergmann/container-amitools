FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y \
        git \
        python-pip && \
    rm -rf /var/lib/apt/lists/* && \
    pip install cython && \
    cd /root && \
    git clone https://github.com/cnvogelg/amitools.git && \
    cd /root/amitools && \
    git checkout -qf 009db40cbe06bbae03a36b1a04f41788a0ba3b92 && \
    python setup.py install && \
    cd / && \
    rm -rf /root/amitools && \
    apt-get purge -y \
        git && \
    apt-get -y autoremove

