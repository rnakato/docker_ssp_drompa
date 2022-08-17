for tag in latest 2022.08 #2022.07 #2022.02 #2021.08
do
    docker build -t rnakato/ssp_drompa:$tag . #--no-cache
    docker push rnakato/ssp_drompa:$tag
done

tag=dorowu-bionic
#docker build -f Dockerfile.dorowu -t rnakato/ssp_drompa_dorowu:$tag . --no-cache
#docker push rnakato/ssp_drompa_dorowu:$tag
