# Ubuntu 17.04 ("Zesty Zapus") 64-bit
FROM ubuntu:17.04

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
    git checkout -qf 5478ee5a6fb01e332706e33112fc2f915757decc && \

# Build amitools
    python setup.py install && \

# Cleanup
    cd / && \
    rm -rf /root/amitools && \
    apt-get purge -y \
        git && \
    apt-get -y autoremove

