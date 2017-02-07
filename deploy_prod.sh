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

  #aws s3 cp ${APP_NAME}-${APP_VERSION}.zip s3://${APP_NAME}/${APP_NAME}-${APP_VERSION}.zip
  eb init ${APP_NAME}

  #aws s3 cp ${APP_NAME}-${APP_VERSION}.zip s3://${APP_NAME}/${APP_NAME}-${APP_VERSION}.zip

#  aws elasticbeanstalk create-application-version \
#    --application-name ${APP_NAME} \
#    --version-label ${APP_VERSION} \
#    --source-bundle S3Bucket="${APP_NAME}", S3Key="${APP_NAME}-${APP_VERSION}.zip"

  eb create "${APP_NAME}-prod" \
    --cfg savedconfig \
    --instance_type t2.micro \
    --platform docker-1.12.6 \
    --region us-east-1 \
    --scale 2 \
    --version ${APP_VERSION} \

  echo $(eb status "${APP_NAME}-prod");
  echo $(eb status "${APP_NAME}-prodg");

  eb deploy "${APP_NAME}-prod"

#else

 # echo bleu

  #eb deploy "${APP_NAME}-prod"

#fi
