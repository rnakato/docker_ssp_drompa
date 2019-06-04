# SSP version 1.1.3
# DROMPA version 3.7.1
# DROMPAplus version 1.1.3
# SSP binary will be installed in /home/SSP/bin/
# DROMPA3 binary will be installed in /home/DROMPA3/
# DROMPAplus binary will be installed in /home/DROMPAplus/bin


FROM rnakato/ubuntu:18.04
MAINTAINER Ryuichiro Nakato <rnakato@iam.u-tokyo.ac.jp>

WORKDIR /home
ENV DEBIAN_FRONTEND=noninteractive

ENV PACKAGES git build-essential libboost-all-dev libgsl-dev libgtkmm-3.0-dev libz-dev samtools \
    libgtk2.0-dev libgsl-dev r-base ca-certificates

RUN apt update \
    && apt install -y --no-install-recommends ${PACKAGES} \
    && apt clean
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

ENV PATH ${PATH}:/home/SSP/bin:/home/DROMPA3:/home/DROMPAplus/bin:/home/DROMPAplus/cpdf/Linux-Intel-64bit:/home/script

CMD ["/bin/bash"]
