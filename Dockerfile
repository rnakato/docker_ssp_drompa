# SSP version 1.2.3
# DROMPA version 3.7.2
# DROMPAplus version 1.12.2
# SSP binary will be installed in /home/SSP/bin/
# DROMPA3 binary will be installed in /home/DROMPA3/
# DROMPAplus binary will be installed in /home/DROMPAplus/bin
# ChIPseqTools binary will be installed in /home/ChIPseqTools/bin
# Python3.8 is in /usr/local/bin

FROM rnakato/ubuntu:20.04
LABEL maintainer "Ryuichiro Nakato <rnakato@iqb.u-tokyo.ac.jp>"

WORKDIR /home
ENV DEBIAN_FRONTEND=noninteractive

ENV PATH /usr/local/bin:${PATH}:/home/SSP/bin:/home/DROMPA3:/home/DROMPAplus/bin:/home/DROMPAplus/submodules/cpdf/Linux-Intel-64bit:/home/DROMPAplus/otherbins:/home/ChIPseqTools/bin/:/home/script

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    clang \
    cmake \
    git \
    libboost-all-dev \
    libbz2-dev \
    libcurl4-gnutls-dev \
    libgsl-dev \
    libgtk2.0-dev \
    libgtkmm-3.0-dev \
    libgzstream0 \
    libgzstream-dev \
    liblzma-dev \
    libz-dev \
    r-base \
    python3-pip \
    python3-setuptools \
    samtools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/rnakato/SSP.git \
    && cd SSP \
    && make
RUN git clone https://github.com/rnakato/DROMPA3 \
    && cd DROMPA3 \
    && make
RUN git clone --recursive https://github.com/rnakato/DROMPAplus \
    && cd DROMPAplus \
    && git submodule foreach git pull origin master \
    && make
RUN git clone --recursive https://github.com/rnakato/ChIPseqTools.git \
    && cd ChIPseqTools \
    && make

#RUN pip3 install python3-setuptools \
RUN pip3 install pandas seaborn matplotlib

RUN ln -s /usr/bin/python3 /usr/local/bin/python

CMD ["/bin/bash"]
