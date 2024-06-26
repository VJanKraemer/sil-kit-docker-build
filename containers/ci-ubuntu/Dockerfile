ARG UBUNTU_VERSION="18.04"

FROM ubuntu:${UBUNTU_VERSION}

ENV TZ "Europe/Berlin"
ENV DEBIAN_FRONTEND "noninteractive"
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8



# Install dependencies
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
        lsb-base \
        lsb-release \
        ninja-build \
        doxygen \
        python3-pip \
        && \
        apt-get clean

COPY --from=utils fetch_cmake.sh /tmp/fetch_cmake.sh
COPY --from=utils docs_requirements.txt /tmp

ADD https://apt.llvm.org/llvm.sh /tmp


RUN chmod +x /tmp/fetch_cmake.sh
RUN /tmp/fetch_cmake.sh
ENV PATH /opt/vector/bin:$PATH
RUN python3 -m  pip install --upgrade pip
RUN python3 -m  pip install -r /tmp/docs_requirements.txt

RUN chmod +x /tmp/llvm.sh
RUN /tmp/llvm.sh 18
