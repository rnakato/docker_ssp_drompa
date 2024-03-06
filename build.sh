for tag in 2024.03
do
    docker build -t rnakato/ssp_drompa:$tag . --no-cache
    docker push rnakato/ssp_drompa:$tag
done

tag=dorowu-bionic
#docker build -f Dockerfile.dorowu -t rnakato/ssp_drompa_dorowu:$tag . --no-cache
#docker push rnakato/ssp_drompa_dorowu:$tag
