#!/bin/bash

set -o errexit
set -o nounset

APP_VERSION=$(git rev-parse --short HEAD);
APP_NAME="deploy-pipeline-test";

function createApp {
  eb init ${APP_NAME} --region us-east-1 --platform docker-1.12.6
}

function createEnv {
  eb create "${APP_NAME}-prod" \
    --instance_type t2.micro \
    --platform docker-1.12.6 \
    --region us-east-1 \
    --scale 1
}

function updateEnv {
  eb deploy "${APP_NAME}-prod"
}

createApp

if eb status "${APP_NAME}-prod"; then
    updateEnv
else
    createEnv
fi
