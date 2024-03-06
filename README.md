# docker_ssp_drompa
Repository of Docker image for SSP and DROMPA

- SSP version 1.3.2
- DROMPAplus version 1.18.2
- DROMPA version 3.7.2
- ChIPsqTools version 1.0.0

- SSP binary will be installed in /home/SSP/bin/
- DROMPA3 binary will be installed in /home/DROMPA3/
- DROMPAplus binary will be installed in /home/DROMPAplus/bin
- ChIPseqTools binary will be installed in /home/ChIPseqTools/bin
- Python3.8 is in /usr/local/bin

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
