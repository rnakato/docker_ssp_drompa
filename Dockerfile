# SSP version 1.1.3
# DROMPA version 3.7.2
# DROMPAplus version 1.3.2
# SSP binary will be installed in /home/SSP/bin/
# DROMPA3 binary will be installed in /home/DROMPA3/
# DROMPAplus binary will be installed in /home/DROMPAplus/bin

FROM rnakato/ubuntu:dorowu-bionic
LABEL maintainer "Ryuichiro Nakato <rnakato@iam.u-tokyo.ac.jp>"

WORKDIR /home
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    git \
    libboost-all-dev \
    libgsl-dev \
    libgtk2.0-dev \
    libgtkmm-3.0-dev \
    libz-dev \
    r-base \
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
    && make
ADD script script

ENV PATH ${PATH}:/home/SSP/bin:/home/DROMPA3:/home/DROMPAplus/bin:/home/DROMPAplus/submodules/cpdf/Linux-Intel-64bit:/home/DROMPAplus/otherbins:/home/script

CMD ["/bin/bash"]
