FROM fedora-minimal:37

RUN microdnf update -y && \
    microdnf install -y \
        gcc \
        git \
        python3 \
        python3-devel \
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
    microdnf clean all

