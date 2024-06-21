FROM ubuntu:20.04

ENV TZ "Europe/Berlin"
ENV DEBIAN_FRONTEND "noninteractive"
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN \
        apt-get update \
        && \
        apt-get install --no-install-recommends --no-install-suggests -y \
        wget \
        gnupg2 \
        software-properties-common \
        && \
        apt update \
        && \
        apt install -y \
        git \
        build-essential \
        sudo \
        gcc-9 \
        g++-9 \
        lsb-base \
        lsb-release \
        ninja-build \
        doxygen \
        clang \
        llvm \
        python3-pip \
        && \
        apt-get clean

COPY --from=utils fetch_cmake.sh /tmp/fetch_cmake.sh
COPY --from=utils docs_requirements.txt /tmp

RUN chmod +x /tmp/fetch_cmake.sh
RUN /tmp/fetch_cmake.sh
ENV PATH /opt/vector/bin:$PATH
RUN python3 -m pip install  --upgrade pip
RUN python3 -m pip install  -r /tmp/docs_requirements.txt
