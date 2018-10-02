FROM ubuntu:18.10

RUN apt-get update && \
    apt-get install -y \
        git \
        python-pip && \
    rm -rf /var/lib/apt/lists/* && \
    pip install cython && \
    cd /root && \
    git clone https://github.com/cnvogelg/amitools.git && \
    cd /root/amitools && \
    git checkout -qf bc92fe0f90e4689e31ac83ff8dac48d60e58be26 && \
    python setup.py install && \
    cd / && \
    rm -rf /root/amitools && \
    apt-get purge -y \
        git && \
    apt-get -y autoremove

