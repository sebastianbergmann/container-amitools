FROM ubuntu:17.10

# Update base system and install build dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        python-pip && \
    rm -rf /var/lib/apt/lists/* && \
    pip install cython && \

# Clone amitools.git repository (at last known good revision)
    cd /root && \
    git clone https://github.com/cnvogelg/amitools.git && \
    cd /root/amitools && \
    git checkout -qf b3b31791c79ce381deb5eee73df0fe47e2e0945f && \

# Build amitools
    python setup.py install && \

# Cleanup
    cd / && \
    rm -rf /root/amitools && \
    apt-get purge -y \
        git && \
    apt-get -y autoremove

