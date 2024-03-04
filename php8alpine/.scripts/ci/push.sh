#!/bin/sh

set -euo pipefail;

if [[ $# -eq 0 ]]; then
    echo "No environment argument provided! Usage: push.sh ENVIRONMENT"
    exit 1
fi

environment=$1

echo "Starting Docker image push to environment: ${environment}..."

case ${environment} in
    "production")
        export AWS_ACCESS_KEY_ID=${PRODUCTION_AWS_ACCESS_KEY_ID}
        export AWS_SECRET_ACCESS_KEY=${PRODUCTION_AWS_SECRET_ACCESS_KEY}
        ;;
    "staging")
        export AWS_ACCESS_KEY_ID=${STAGING_AWS_ACCESS_KEY_ID}
        export AWS_SECRET_ACCESS_KEY=${STAGING_AWS_SECRET_ACCESS_KEY}
        ;;
    "qa")
        export AWS_ACCESS_KEY_ID=${QA_AWS_ACCESS_KEY_ID}
        export AWS_SECRET_ACCESS_KEY=${QA_AWS_SECRET_ACCESS_KEY}
        ;;
    *)
        output_error "Invalid environment provided. Expected: production or staging"
        exit 1
        ;;
esac

# Install Amazon ECR Docker Credential Helper by extracting binary due to lack of Alpine package
apk add --update rpm wget
mkdir /tmp/amazon-ecr-credential-helper
(cd /tmp/amazon-ecr-credential-helper && wget https://cdn.amazonlinux.com/blobstore/917d21e71cf32d8b418c51f477e92c60791870f0eb138423a4fa628e4671f601/amazon-ecr-credential-helper-0.2.0-2.amzn2.x86_64.rpm && rpm2cpio amazon-ecr-credential-helper-0.2.0-2.amzn2.x86_64.rpm | cpio -idmv && cp ./usr/bin/docker-credential-ecr-login /usr/local/bin/)

# Configure Docker
mkdir ~/.docker
echo '{"credsStore":"ecr-login"}' >> ~/.docker/config.json

# Load the built images from artifacts
docker load -i images/app.tar
docker load -i images/nginx.tar

# Tag and push app image
docker tag app:${CI_COMMIT_SHA} 160431522231.dkr.ecr.eu-west-1.amazonaws.com/${environment}-api-php:${CI_COMMIT_SHA}
docker push 160431522231.dkr.ecr.eu-west-1.amazonaws.com/${environment}-api-php:${CI_COMMIT_SHA}

# Tag and push nginx image
docker tag nginx:${CI_COMMIT_SHA} 160431522231.dkr.ecr.eu-west-1.amazonaws.com/${environment}-api-nginx:${CI_COMMIT_SHA}
docker push 160431522231.dkr.ecr.eu-west-1.amazonaws.com/${environment}-api-nginx:${CI_COMMIT_SHA}
