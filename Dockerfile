# SSP version 1.1.3
# DROMPA version 3.7.1
# SSP binary will be installed in /home/SSP/bin/
# DROMPA binary will be installed in /home/DROMPA3/

FROM ubuntu:18.04
MAINTAINER Ryuichiro Nakato <rnakato@iam.u-tokyo.ac.jp>

# tzdataをinstallするときにtimezoneの選択をしない
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /home

ENV PACKAGES git build-essential libboost-all-dev libgsl-dev libz-dev samtools \
    libgtk2.0-dev libgsl-dev r-base ca-certificates

RUN apt update \
    && apt install -y --no-install-recommends ${PACKAGES} \
    && apt clean
RUN git clone https://github.com/rnakato/SSP.git \
    && cd SSP \
    && make
RUN git clone https://github.com/coherentgraphics/cpdf-binaries
RUN git clone https://github.com/rnakato/DROMPA3 \
    && cd DROMPA3 \
    && make
ADD script script

ENV PATH ${PATH}:/home/SSP/bin:/home/DROMPA3:/home/cpdf-binaries/Linux-Intel-64bit:/home/script

CMD ["/bin/bash"]
