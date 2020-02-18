for tag in latest
do
    docker build -t rnakato/ssp_drompa:$tag .
    docker push rnakato/ssp_drompa:$tag
done
