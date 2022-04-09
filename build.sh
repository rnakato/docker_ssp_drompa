for tag in latest 2022.04 #2022.02 #2021.08 #18.04
do
    docker build -t rnakato/ssp_drompa:$tag . #--no-cache
    docker push rnakato/ssp_drompa:$tag
done

exit
tag=dorowu-bionic
docker build -f Dockerfile.dorowu -t rnakato/ssp_drompa:$tag . --no-cache
docker push rnakato/ssp_drompa:$tag
