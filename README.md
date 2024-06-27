# docker_ssp_drompa
Repository of Docker image for SSP and DROMPA

- SSP version 1.3.2
- DROMPAplus version 1.19.0
- DROMPA version 3.7.2
- ChIPseqTools version 1.0.0

- SSP binary will be installed in /home/SSP/bin/
- DROMPA3 binary will be installed in /home/DROMPA3/
- DROMPAplus binary will be installed in /home/DROMPAplus/bin
- ChIPseqTools binary will be installed in /home/ChIPseqTools/bin
- Python3.9 is in /usr/local/bin


## ChangeLog

- 2024.06
  - Updated DROMPAplus to v1.19.0


## Run

For Docker:

    # pull docker image
    docker pull rnakato/ssp_drompa

    # execute drompa+
    docker run --rm -it rnakato/ssp_drompa drompa+

For Singularity:

    # build image
    singularity build -F rnakato_ssp_drompa.sif docker://rnakato/ssp_drompa
    # execute drompa+
    singularity exec rnakato_ssp_drompa.sif drompa+

## Build image from Dockerfile
First clone and move to the repository

    git clone https://github.com/rnakato/docker_ssp_drompa.git
    cd docker_ssp_drompa

Then type:

    docker build -t <account>/ssp_drompa .
