#!/bin/bash

set -o errexit
set -o nounset

APP_VERSION=$(git rev-parse --short HEAD);
APP_NAME="deploy-pipeline-test";

#git clean -fd
#zip -x *.git* -r "${APP_NAME}-${APP_VERSION}.zip" .

#dnsIsAvailable=$(aws elasticbeanstalk check-dns-availability --cname-prefix ${APP_NAME} | jq '.Available')

#echo $(dnsIsAvailable)
echo rouge

#if [ "$dnsIsAvailable" != "true" ]; then


 ## eb init ${APP_NAME} --region us-east-1 --platform docker-1.12.6

echo vert

#  eb create "${APP_NAME}-prod" \
#    --instance_type t2.micro \
#    --platform docker-1.12.6 \
#    --region us-east-1 \
#    --scale 1

  echo $(eb status "${APP_NAME}-prod");
    echo jaune;
  echo $(eb status "${APP_NAME}-prodg");

  eb deploy "${APP_NAME}-prod"

#else

 # echo bleu

  #eb deploy "${APP_NAME}-prod"

#fi
