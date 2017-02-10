#!/bin/bash

set -o errexit
set -o nounset

APP_VERSION=$(git rev-parse --short HEAD);
APP_NAME="deploy-pipeline-test";
APP_ENV=$1;

function createApp {
  eb init ${APP_NAME} --region us-east-1 --platform docker-1.12.6
}

function createEnv {
  eb create "${APP_NAME}-${APP_ENV}" \
    --instance_type t2.micro \
    --platform docker-1.12.6 \
    --region us-east-1 \
    --scale 1
}

function updateEnv {
  eb deploy "${APP_NAME}-${APP_ENV}"
}

createApp

if eb status "${APP_NAME}-${APP_ENV}"; then
    updateEnv
else
    createEnv
fi
