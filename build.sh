for tag in latest 20.04 #18.04
do
    docker build -t rnakato/ssp_drompa:$tag .
    docker push rnakato/ssp_drompa:$tag
done

tag=dorowu-bionic
#docker build -f Dockerfile.dorowu -t rnakato/ssp_drompa:$tag .
#docker push rnakato/ssp_drompa:$tag
