#!/bin/sh

set -euo pipefail;

if [[ $# -eq 0 ]]; then
    echo "No environment argument provided! Usage: deploy.sh ENVIRONMENT"
    exit 1
fi

environment=$1

echo "Starting deployment to environment: ${environment}..."

case ${environment} in
    "production")
        export AWS_ACCESS_KEY_ID=${PRODUCTION_AWS_ACCESS_KEY_ID}
        export AWS_SECRET_ACCESS_KEY=${PRODUCTION_AWS_SECRET_ACCESS_KEY}

        export SQS_QUEUE_PROCESSOR_TASK_FAMILY="production-api-sqs-queue-processor"
        export SQS_QUEUE_PROCESSOR_TASK_CONTAINER_SQS_QUEUE_PROCESSOR_LOG_GROUP="production-api-sqs-queue-processor"
        export SQS_QUEUE_PROCESSOR_TASK_CONTAINER_SQS_QUEUE_PROCESSOR_LOG_PREFIX="production-api-sqs-queue-processor"
        export HUBSPOT_SYNC_TASK_FAMILY="production-api-hubspot-sync"
        export HUBSPOT_SYNC_TASK_CONTAINER_HUBSPOT_SYNC_LOG_GROUP="production-api-hubspot-sync"
        export HUBSPOT_SYNC_TASK_CONTAINER_HUBSPOT_SYNC_LOG_PREFIX="production-api-hubspot-sync"
        export MAILCHIMP_SYNC_TASK_FAMILY="production-api-mailchimp-sync"
        export MAILCHIMP_SYNC_TASK_CONTAINER_MAILCHIMP_SYNC_LOG_GROUP="production-api-mailchimp-sync"
        export MAILCHIMP_SYNC_TASK_CONTAINER_MAILCHIMP_SYNC_LOG_PREFIX="production-api-mailchimp-sync"
        export PRE_DEPLOY_TASK_CLUSTER="production-api"
        export PRE_DEPLOY_TASK_SECURITY_GROUP="sg-0d2e0aefeb5a712ca"
        export PRE_DEPLOY_TASK_SUBNET_1="subnet-0de1168132ebdf89e"
        export PRE_DEPLOY_TASK_SUBNET_2="subnet-0669fe166a2584aee"
        export PRE_DEPLOY_TASK_SUBNET_3="subnet-08567353e4cc27ea7"
        export PRE_DEPLOY_TASK_FAMILY="production-api-pre-deploy"
        export PRE_DEPLOY_TASK_STARTED_BY="deploy-job-${CI_JOB_ID}"
        export PRE_DEPLOY_TASK_CONTAINER_PRE_DEPLOY_LOG_GROUP="production-api-pre-deploy"
        export PRE_DEPLOY_TASK_CONTAINER_PRE_DEPLOY_LOG_PREFIX="production-api-pre-deploy"
        export SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_FAMILY="production-api-subscription-renewal-notification"
        export SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_CONTAINER_SUBSCRIPTION_RENEWAL_NOTIFICATION_LOG_GROUP="production-api-subscription-renewal-notification"
        export SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_CONTAINER_SUBSCRIPTION_RENEWAL_NOTIFICATION_LOG_PREFIX="production-api-subscription-renewal-notification"
        export EVENT_NOTIFICATION_TASK_FAMILY="production-api-event-notification"
        export EVENT_NOTIFICATION_TASK_CONTAINER_EVENT_NOTIFICATION_LOG_GROUP="production-api-event-notification"
        export EVENT_NOTIFICATION_TASK_CONTAINER_EVENT_NOTIFICATION_LOG_PREFIX="production-api-event-notification"
        export TASK_FAMILY="production-api"
        export TASK_TASK_ROLE_ARN="arn:aws:iam::160431522231:role/production-ecs-task-api"
        export TASK_EXECUTION_ROLE_ARN="arn:aws:iam::160431522231:role/ECSTaskExecutionRolePolicy-production-api"
        export TASK_ENVIRONMENT="production"
        export TASK_CONTAINER_INIT_LOG_GROUP="production-api-init"
        export TASK_CONTAINER_INIT_LOG_PREFIX="production-api-init"
        export TASK_CONTAINER_PHP_IMAGE="160431522231.dkr.ecr.eu-west-1.amazonaws.com/production-api-php:${CI_COMMIT_SHA}"
        export TASK_CONTAINER_PHP_LOG_GROUP="production-api-php"
        export TASK_CONTAINER_PHP_LOG_PREFIX="production-api-php"
        export TASK_CONTAINER_PHP_ENV_API_HOSTNAME="https://api.perfectlyspoken.com"
        export TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PUBLIC="production-storage-public-r5cw0jvdrcxg7nt7"
        export TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PRIVATE="production-storage-private-w6lovltyzte2ydnf"
        export TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PRIVATE_KMS_KEY_ID="ff843244-1615-40f8-9679-ddd87c613d81"
        export TASK_CONTAINER_PHP_ENV_AWS_TRANSCODING_ENVIRONMENT="production"
        export TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_ADMIN_URL="https://admin.perfectlyspoken.com"
        export TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_STUDENT_URL="https://app.perfectlyspoken.com"
        export TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_TEAM_URL="https://{subdomain}.perfectlyspoken.team"
        export TASK_CONTAINER_PHP_SEC_DATABASE_HOST="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-rds-host-yv816r"
        export TASK_CONTAINER_PHP_SEC_DATABASE_USER="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-rds-username-vBNt6u"
        export TASK_CONTAINER_PHP_SEC_DATABASE_PASSWORD="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-rds-password-PxAFks"
        export TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_HOST="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-elasticsearch-host-fTgSca"
        export TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_PORT="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-elasticsearch-port-qgMgam"
        export TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_AUTH="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-elasticsearch-auth-xcpCtj"
        export TASK_CONTAINER_PHP_SEC_HUBSPOT_API_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-hubspot-api-key-JC8knj"
        export TASK_CONTAINER_PHP_SEC_JWT_HMAC_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-jwt-hmac-key-v2WQd9"
        export TASK_CONTAINER_PHP_SEC_MAILCHIMP_API_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-mailchimp-api-key-2GZBRY"
        export TASK_CONTAINER_PHP_SEC_MAILCHIMP_AUDIENCE_ID="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-mailchimp-audience-id-2GZBRY"
        export TASK_CONTAINER_PHP_SEC_MAILER_USER="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-ses-smtp-access-key-id-SvGldo"
        export TASK_CONTAINER_PHP_SEC_MAILER_PASSWORD="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-ses-smtp-access-key-secret-NsnuXo"
        export TASK_CONTAINER_PHP_SEC_RECAPTCHA_SECRET_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-recaptcha-secret-key-tBhIol"
        export TASK_CONTAINER_PHP_SEC_STRIPE_API_SECRET_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-stripe-api-secret-key-1hI5Ua"
        export TASK_CONTAINER_PHP_SEC_STRIPE_WEBHOOK_SECRET_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-stripe-webhook-secret-key-2lN3dI"
        export TASK_CONTAINER_PHP_SEC_SYMFONY_SECRET="arn:aws:secretsmanager:eu-west-1:160431522231:secret:production-api-symfony-secret-7uXHMq"
        export TASK_CONTAINER_NGINX_IMAGE="160431522231.dkr.ecr.eu-west-1.amazonaws.com/production-api-nginx:${CI_COMMIT_SHA}"
        export TASK_CONTAINER_NGINX_LOG_GROUP="production-api-nginx"
        export TASK_CONTAINER_NGINX_LOG_PREFIX="production-api-nginx"

        ;;
    "staging")
        export AWS_ACCESS_KEY_ID=${STAGING_AWS_ACCESS_KEY_ID}
        export AWS_SECRET_ACCESS_KEY=${STAGING_AWS_SECRET_ACCESS_KEY}

        export SQS_QUEUE_PROCESSOR_TASK_FAMILY="staging-api-sqs-queue-processor"
        export SQS_QUEUE_PROCESSOR_TASK_CONTAINER_SQS_QUEUE_PROCESSOR_LOG_GROUP="staging-api-sqs-queue-processor"
        export SQS_QUEUE_PROCESSOR_TASK_CONTAINER_SQS_QUEUE_PROCESSOR_LOG_PREFIX="staging-api-sqs-queue-processor"
        export HUBSPOT_SYNC_TASK_FAMILY="staging-api-hubspot-sync"
        export HUBSPOT_SYNC_TASK_CONTAINER_HUBSPOT_SYNC_LOG_GROUP="staging-api-hubspot-sync"
        export HUBSPOT_SYNC_TASK_CONTAINER_HUBSPOT_SYNC_LOG_PREFIX="staging-api-hubspot-sync"
        export MAILCHIMP_SYNC_TASK_FAMILY="staging-api-mailchimp-sync"
        export MAILCHIMP_SYNC_TASK_CONTAINER_MAILCHIMP_SYNC_LOG_GROUP="staging-api-mailchimp-sync"
        export MAILCHIMP_SYNC_TASK_CONTAINER_MAILCHIMP_SYNC_LOG_PREFIX="staging-api-mailchimp-sync"
        export PRE_DEPLOY_TASK_CLUSTER="staging-api"
        export PRE_DEPLOY_TASK_SECURITY_GROUP="sg-0aa5156d7de6c7f9d"
        export PRE_DEPLOY_TASK_SUBNET_1="subnet-0c22066c3094e8b31"
        export PRE_DEPLOY_TASK_SUBNET_2="subnet-05579d288e39c940e"
        export PRE_DEPLOY_TASK_SUBNET_3="subnet-07e9191e0830eab84"
        export PRE_DEPLOY_TASK_FAMILY="staging-api-pre-deploy"
        export PRE_DEPLOY_TASK_STARTED_BY="deploy-job-${CI_JOB_ID}"
        export PRE_DEPLOY_TASK_CONTAINER_PRE_DEPLOY_LOG_GROUP="staging-api-pre-deploy"
        export PRE_DEPLOY_TASK_CONTAINER_PRE_DEPLOY_LOG_PREFIX="staging-api-pre-deploy"
        export SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_FAMILY="staging-api-subscription-renewal-notification"
        export SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_CONTAINER_SUBSCRIPTION_RENEWAL_NOTIFICATION_LOG_GROUP="staging-api-subscription-renewal-notification"
        export SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_CONTAINER_SUBSCRIPTION_RENEWAL_NOTIFICATION_LOG_PREFIX="staging-api-subscription-renewal-notification"
        export EVENT_NOTIFICATION_TASK_FAMILY="staging-api-event-notification"
        export EVENT_NOTIFICATION_TASK_CONTAINER_EVENT_NOTIFICATION_LOG_GROUP="staging-api-event-notification"
        export EVENT_NOTIFICATION_TASK_CONTAINER_EVENT_NOTIFICATION_LOG_PREFIX="staging-api-event-notification"
        export TASK_FAMILY="staging-api"
        export TASK_TASK_ROLE_ARN="arn:aws:iam::160431522231:role/staging-ecs-task-api"
        export TASK_EXECUTION_ROLE_ARN="arn:aws:iam::160431522231:role/ECSTaskExecutionRolePolicy-staging-api"
        export TASK_ENVIRONMENT="staging"
        export TASK_CONTAINER_INIT_LOG_GROUP="staging-api-init"
        export TASK_CONTAINER_INIT_LOG_PREFIX="staging-api-init"
        export TASK_CONTAINER_PHP_IMAGE="160431522231.dkr.ecr.eu-west-1.amazonaws.com/staging-api-php:${CI_COMMIT_SHA}"
        export TASK_CONTAINER_PHP_LOG_GROUP="staging-api-php"
        export TASK_CONTAINER_PHP_LOG_PREFIX="staging-api-php"
        export TASK_CONTAINER_PHP_ENV_API_HOSTNAME="https://api.staging.perfectlyspoken.com"
        export TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PUBLIC="staging-storage-public-pr7mc4wlhcnffljz"
        export TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PRIVATE="staging-storage-private-w0lzxx9vmxhscaxa"
        export TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PRIVATE_KMS_KEY_ID="0cf116d1-cb14-45ae-b496-359016d5a6a1"
        export TASK_CONTAINER_PHP_ENV_AWS_TRANSCODING_ENVIRONMENT="staging"
        export TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_ADMIN_URL="https://admin.staging.perfectlyspoken.com"
        export TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_STUDENT_URL="https://student.staging.perfectlyspoken.com"
        export TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_TEAM_URL="https://{subdomain}.staging.perfectlyspoken.team"
        export TASK_CONTAINER_PHP_SEC_DATABASE_HOST="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-rds-host-DB0pSZ"
        export TASK_CONTAINER_PHP_SEC_DATABASE_USER="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-rds-username-AHFTS2"
        export TASK_CONTAINER_PHP_SEC_DATABASE_PASSWORD="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-rds-password-DB0pSZ"
        export TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_HOST="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-elasticsearch-host-gMEcFK"
        export TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_PORT="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-elasticsearch-port-IOOv1K"
        export TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_AUTH="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-elasticsearch-auth-cKlloI"
        export TASK_CONTAINER_PHP_SEC_HUBSPOT_API_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-hubspot-api-key-EPPoct"
        export TASK_CONTAINER_PHP_SEC_JWT_HMAC_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-jwt-hmac-key-JHRHdz"
        export TASK_CONTAINER_PHP_SEC_MAILCHIMP_API_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-mailchimp-api-key-G4xXxU"
        export TASK_CONTAINER_PHP_SEC_MAILCHIMP_AUDIENCE_ID="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-mailchimp-audience-id-YRbe9P"
        export TASK_CONTAINER_PHP_SEC_MAILER_USER="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-ses-smtp-access-key-id-RNJOfC"
        export TASK_CONTAINER_PHP_SEC_MAILER_PASSWORD="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-ses-smtp-access-key-secret-8Am4Rx"
        export TASK_CONTAINER_PHP_SEC_RECAPTCHA_SECRET_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-recaptcha-secret-key-Y0HMgs"
        export TASK_CONTAINER_PHP_SEC_STRIPE_API_SECRET_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-stripe-api-secret-key-KWfYOA"
        export TASK_CONTAINER_PHP_SEC_STRIPE_WEBHOOK_SECRET_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-stripe-webhook-secret-key-N0kgEC"
        export TASK_CONTAINER_PHP_SEC_SYMFONY_SECRET="arn:aws:secretsmanager:eu-west-1:160431522231:secret:staging-api-symfony-secret-sxFhbv"
        export TASK_CONTAINER_NGINX_IMAGE="160431522231.dkr.ecr.eu-west-1.amazonaws.com/staging-api-nginx:${CI_COMMIT_SHA}"
        export TASK_CONTAINER_NGINX_LOG_GROUP="staging-api-nginx"
        export TASK_CONTAINER_NGINX_LOG_PREFIX="staging-api-nginx"
        ;;
    "qa")
        export AWS_ACCESS_KEY_ID=${QA_AWS_ACCESS_KEY_ID}
        export AWS_SECRET_ACCESS_KEY=${QA_AWS_SECRET_ACCESS_KEY}

        export SQS_QUEUE_PROCESSOR_TASK_FAMILY="qa-api-sqs-queue-processor"
        export SQS_QUEUE_PROCESSOR_TASK_CONTAINER_SQS_QUEUE_PROCESSOR_LOG_GROUP="qa-api-sqs-queue-processor"
        export SQS_QUEUE_PROCESSOR_TASK_CONTAINER_SQS_QUEUE_PROCESSOR_LOG_PREFIX="qa-api-sqs-queue-processor"
        export HUBSPOT_SYNC_TASK_FAMILY="qa-api-hubspot-sync"
        export HUBSPOT_SYNC_TASK_CONTAINER_HUBSPOT_SYNC_LOG_GROUP="qa-api-hubspot-sync"
        export HUBSPOT_SYNC_TASK_CONTAINER_HUBSPOT_SYNC_LOG_PREFIX="qa-api-hubspot-sync"
        export MAILCHIMP_SYNC_TASK_FAMILY="qa-api-mailchimp-sync"
        export MAILCHIMP_SYNC_TASK_CONTAINER_MAILCHIMP_SYNC_LOG_GROUP="qa-api-mailchimp-sync"
        export MAILCHIMP_SYNC_TASK_CONTAINER_MAILCHIMP_SYNC_LOG_PREFIX="qa-api-mailchimp-sync"
        export PRE_DEPLOY_TASK_CLUSTER="qa-api"
        export PRE_DEPLOY_TASK_SECURITY_GROUP="sg-03c9f75f99ebf6147"
        export PRE_DEPLOY_TASK_SUBNET_1="subnet-09aac97394eeeb029"
        export PRE_DEPLOY_TASK_SUBNET_2="subnet-0bda335398e370b23"
        export PRE_DEPLOY_TASK_SUBNET_3="subnet-036c99926a87b9fa0"
        export PRE_DEPLOY_TASK_FAMILY="qa-api-pre-deploy"
        export PRE_DEPLOY_TASK_STARTED_BY="deploy-job-${CI_JOB_ID}"
        export PRE_DEPLOY_TASK_CONTAINER_PRE_DEPLOY_LOG_GROUP="qa-api-pre-deploy"
        export PRE_DEPLOY_TASK_CONTAINER_PRE_DEPLOY_LOG_PREFIX="qa-api-pre-deploy"
        export SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_FAMILY="qa-api-subscription-renewal-notification"
        export SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_CONTAINER_SUBSCRIPTION_RENEWAL_NOTIFICATION_LOG_GROUP="qa-api-subscription-renewal-notification"
        export SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_CONTAINER_SUBSCRIPTION_RENEWAL_NOTIFICATION_LOG_PREFIX="qa-api-subscription-renewal-notification"
        export EVENT_NOTIFICATION_TASK_FAMILY="qa-api-event-notification"
        export EVENT_NOTIFICATION_TASK_CONTAINER_EVENT_NOTIFICATION_LOG_GROUP="qa-api-event-notification"
        export EVENT_NOTIFICATION_TASK_CONTAINER_EVENT_NOTIFICATION_LOG_PREFIX="qa-api-event-notification"
        export TASK_FAMILY="qa-api"
        export TASK_TASK_ROLE_ARN="arn:aws:iam::160431522231:role/qa-ecs-task-api"
        export TASK_EXECUTION_ROLE_ARN="arn:aws:iam::160431522231:role/ECSTaskExecutionRolePolicy-qa-api"
        export TASK_ENVIRONMENT="qa"
        export TASK_CONTAINER_INIT_LOG_GROUP="qa-api-init"
        export TASK_CONTAINER_INIT_LOG_PREFIX="qa-api-init"
        export TASK_CONTAINER_PHP_IMAGE="160431522231.dkr.ecr.eu-west-1.amazonaws.com/qa-api-php:${CI_COMMIT_SHA}"
        export TASK_CONTAINER_PHP_LOG_GROUP="qa-api-php"
        export TASK_CONTAINER_PHP_LOG_PREFIX="qa-api-php"
        export TASK_CONTAINER_PHP_ENV_API_HOSTNAME="https://api.qa.perfectlyspoken.com"
        export TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PUBLIC="qa-storage-public-t484e4s3m32ar8ve"
        export TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PRIVATE="qa-storage-private-czc6ymyo1ab7akrr"
        export TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PRIVATE_KMS_KEY_ID="8ff3ccbe-a465-433a-91ce-a0d23e5ec770"
        export TASK_CONTAINER_PHP_ENV_AWS_TRANSCODING_ENVIRONMENT="qa"
        export TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_ADMIN_URL="https://admin.qa.perfectlyspoken.com"
        export TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_STUDENT_URL="https://student.qa.perfectlyspoken.com"
        export TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_TEAM_URL="https://{subdomain}.qa.perfectlyspoken.team"
        export TASK_CONTAINER_PHP_SEC_DATABASE_HOST="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-rds-host-VmO6Nv"
        export TASK_CONTAINER_PHP_SEC_DATABASE_USER="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-rds-username-BQhxTy"
        export TASK_CONTAINER_PHP_SEC_DATABASE_PASSWORD="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-rds-password-5KgJaO"
        export TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_HOST="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-elasticsearch-host-Wscfj7"
        export TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_PORT="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-elasticsearch-port-XwtUWo"
        export TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_AUTH="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-elasticsearch-auth-TyPJha"
        export TASK_CONTAINER_PHP_SEC_HUBSPOT_API_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-hubspot-api-key-XAhnmi"
        export TASK_CONTAINER_PHP_SEC_JWT_HMAC_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-jwt-hmac-key-qMZG35"
        export TASK_CONTAINER_PHP_SEC_MAILCHIMP_API_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-mailchimp-api-key-w9Rm9U"
        export TASK_CONTAINER_PHP_SEC_MAILCHIMP_AUDIENCE_ID="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-mailchimp-audience-id-91SHE0"
        export TASK_CONTAINER_PHP_SEC_MAILER_USER="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-ses-smtp-access-key-id-YGWwnh"
        export TASK_CONTAINER_PHP_SEC_MAILER_PASSWORD="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-ses-smtp-access-key-secret-Y7PQ0y"
        export TASK_CONTAINER_PHP_SEC_RECAPTCHA_SECRET_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-recaptcha-secret-key-JvKsSH"
        export TASK_CONTAINER_PHP_SEC_STRIPE_API_SECRET_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-stripe-api-secret-key-swFqW9"
        export TASK_CONTAINER_PHP_SEC_STRIPE_WEBHOOK_SECRET_KEY="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-stripe-webhook-secret-key-zGCKKF"
        export TASK_CONTAINER_PHP_SEC_SYMFONY_SECRET="arn:aws:secretsmanager:eu-west-1:160431522231:secret:qa-api-symfony-secret-TuHmTc"
        export TASK_CONTAINER_NGINX_IMAGE="160431522231.dkr.ecr.eu-west-1.amazonaws.com/qa-api-nginx:${CI_COMMIT_SHA}"
        export TASK_CONTAINER_NGINX_LOG_GROUP="qa-api-nginx"
        export TASK_CONTAINER_NGINX_LOG_PREFIX="qa-api-nginx"
        ;;
    *)
        output_error "Invalid environment provided. Expected: production or staging"
        exit 1
        ;;
esac

for file in $(find .ecs -type f); do
    sed -i "s|__SQS_QUEUE_PROCESSOR_TASK_FAMILY__|${SQS_QUEUE_PROCESSOR_TASK_FAMILY}|" ${file}
    sed -i "s|__SQS_QUEUE_PROCESSOR_TASK_CONTAINER_SQS_QUEUE_PROCESSOR_LOG_GROUP__|${SQS_QUEUE_PROCESSOR_TASK_CONTAINER_SQS_QUEUE_PROCESSOR_LOG_GROUP}|" ${file}
    sed -i "s|__SQS_QUEUE_PROCESSOR_TASK_CONTAINER_SQS_QUEUE_PROCESSOR_LOG_PREFIX__|${SQS_QUEUE_PROCESSOR_TASK_CONTAINER_SQS_QUEUE_PROCESSOR_LOG_PREFIX}|" ${file}
    sed -i "s|__HUBSPOT_SYNC_TASK_FAMILY__|${HUBSPOT_SYNC_TASK_FAMILY}|" ${file}
    sed -i "s|__HUBSPOT_SYNC_TASK_CONTAINER_HUBSPOT_SYNC_LOG_GROUP__|${HUBSPOT_SYNC_TASK_CONTAINER_HUBSPOT_SYNC_LOG_GROUP}|" ${file}
    sed -i "s|__HUBSPOT_SYNC_TASK_CONTAINER_HUBSPOT_SYNC_LOG_PREFIX__|${HUBSPOT_SYNC_TASK_CONTAINER_HUBSPOT_SYNC_LOG_PREFIX}|" ${file}
    sed -i "s|__MAILCHIMP_SYNC_TASK_FAMILY__|${MAILCHIMP_SYNC_TASK_FAMILY}|" ${file}
    sed -i "s|__MAILCHIMP_SYNC_TASK_CONTAINER_MAILCHIMP_SYNC_LOG_GROUP__|${MAILCHIMP_SYNC_TASK_CONTAINER_MAILCHIMP_SYNC_LOG_GROUP}|" ${file}
    sed -i "s|__MAILCHIMP_SYNC_TASK_CONTAINER_MAILCHIMP_SYNC_LOG_PREFIX__|${MAILCHIMP_SYNC_TASK_CONTAINER_MAILCHIMP_SYNC_LOG_PREFIX}|" ${file}
    sed -i "s|__PRE_DEPLOY_TASK_CLUSTER__|${PRE_DEPLOY_TASK_CLUSTER}|" ${file}
    sed -i "s|__PRE_DEPLOY_TASK_SECURITY_GROUP__|${PRE_DEPLOY_TASK_SECURITY_GROUP}|" ${file}
    sed -i "s|__PRE_DEPLOY_TASK_SUBNET_1__|${PRE_DEPLOY_TASK_SUBNET_1}|" ${file}
    sed -i "s|__PRE_DEPLOY_TASK_SUBNET_2__|${PRE_DEPLOY_TASK_SUBNET_2}|" ${file}
    sed -i "s|__PRE_DEPLOY_TASK_SUBNET_3__|${PRE_DEPLOY_TASK_SUBNET_3}|" ${file}
    sed -i "s|__PRE_DEPLOY_TASK_FAMILY__|${PRE_DEPLOY_TASK_FAMILY}|" ${file}
    sed -i "s|__PRE_DEPLOY_TASK_STARTED_BY__|${PRE_DEPLOY_TASK_STARTED_BY}|" ${file}
    sed -i "s|__PRE_DEPLOY_TASK_CONTAINER_PRE_DEPLOY_LOG_GROUP__|${PRE_DEPLOY_TASK_CONTAINER_PRE_DEPLOY_LOG_GROUP}|" ${file}
    sed -i "s|__PRE_DEPLOY_TASK_CONTAINER_PRE_DEPLOY_LOG_PREFIX__|${PRE_DEPLOY_TASK_CONTAINER_PRE_DEPLOY_LOG_PREFIX}|" ${file}
    sed -i "s|__SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_FAMILY__|${SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_FAMILY}|" ${file}
    sed -i "s|__SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_CONTAINER_SUBSCRIPTION_RENEWAL_NOTIFICATION_LOG_GROUP__|${SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_CONTAINER_SUBSCRIPTION_RENEWAL_NOTIFICATION_LOG_GROUP}|" ${file}
    sed -i "s|__SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_CONTAINER_SUBSCRIPTION_RENEWAL_NOTIFICATION_LOG_PREFIX__|${SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_CONTAINER_SUBSCRIPTION_RENEWAL_NOTIFICATION_LOG_PREFIX}|" ${file}
    sed -i "s|__EVENT_NOTIFICATION_TASK_FAMILY__|${EVENT_NOTIFICATION_TASK_FAMILY}|" ${file}
    sed -i "s|__EVENT_NOTIFICATION_TASK_CONTAINER_EVENT_NOTIFICATION_LOG_GROUP__|${EVENT_NOTIFICATION_TASK_CONTAINER_EVENT_NOTIFICATION_LOG_GROUP}|" ${file}
    sed -i "s|__EVENT_NOTIFICATION_TASK_CONTAINER_EVENT_NOTIFICATION_LOG_PREFIX__|${EVENT_NOTIFICATION_TASK_CONTAINER_EVENT_NOTIFICATION_LOG_PREFIX}|" ${file}
    sed -i "s|__TASK_FAMILY__|${TASK_FAMILY}|" ${file}
    sed -i "s|__TASK_TASK_ROLE_ARN__|${TASK_TASK_ROLE_ARN}|" ${file}
    sed -i "s|__TASK_EXECUTION_ROLE_ARN__|${TASK_EXECUTION_ROLE_ARN}|" ${file}
    sed -i "s|__TASK_ENVIRONMENT__|${TASK_ENVIRONMENT}|" ${file}
    sed -i "s|__TASK_CONTAINER_INIT_LOG_GROUP__|${TASK_CONTAINER_INIT_LOG_GROUP}|" ${file}
    sed -i "s|__TASK_CONTAINER_INIT_LOG_PREFIX__|${TASK_CONTAINER_INIT_LOG_PREFIX}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_IMAGE__|${TASK_CONTAINER_PHP_IMAGE}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_LOG_GROUP__|${TASK_CONTAINER_PHP_LOG_GROUP}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_LOG_PREFIX__|${TASK_CONTAINER_PHP_LOG_PREFIX}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_ENV_API_HOSTNAME__|${TASK_CONTAINER_PHP_ENV_API_HOSTNAME}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PUBLIC__|${TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PUBLIC}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PRIVATE__|${TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PRIVATE}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PRIVATE_KMS_KEY_ID__|${TASK_CONTAINER_PHP_ENV_AWS_STORAGE_BUCKET_PRIVATE_KMS_KEY_ID}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_ENV_AWS_TRANSCODING_ENVIRONMENT__|${TASK_CONTAINER_PHP_ENV_AWS_TRANSCODING_ENVIRONMENT}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_ADMIN_URL__|${TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_ADMIN_URL}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_STUDENT_URL__|${TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_STUDENT_URL}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_TEAM_URL__|${TASK_CONTAINER_PHP_ENV_WEB_INTERFACE_TEAM_URL}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_DATABASE_HOST__|${TASK_CONTAINER_PHP_SEC_DATABASE_HOST}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_DATABASE_USER__|${TASK_CONTAINER_PHP_SEC_DATABASE_USER}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_DATABASE_PASSWORD__|${TASK_CONTAINER_PHP_SEC_DATABASE_PASSWORD}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_HOST__|${TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_HOST}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_PORT__|${TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_PORT}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_AUTH__|${TASK_CONTAINER_PHP_SEC_ELASTICSEARCH_AUTH}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_HUBSPOT_API_KEY__|${TASK_CONTAINER_PHP_SEC_HUBSPOT_API_KEY}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_JWT_HMAC_KEY__|${TASK_CONTAINER_PHP_SEC_JWT_HMAC_KEY}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_MAILCHIMP_API_KEY__|${TASK_CONTAINER_PHP_SEC_MAILCHIMP_API_KEY}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_MAILCHIMP_AUDIENCE_ID__|${TASK_CONTAINER_PHP_SEC_MAILCHIMP_AUDIENCE_ID}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_MAILER_USER__|${TASK_CONTAINER_PHP_SEC_MAILER_USER}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_MAILER_PASSWORD__|${TASK_CONTAINER_PHP_SEC_MAILER_PASSWORD}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_RECAPTCHA_SECRET_KEY__|${TASK_CONTAINER_PHP_SEC_RECAPTCHA_SECRET_KEY}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_STRIPE_API_SECRET_KEY__|${TASK_CONTAINER_PHP_SEC_STRIPE_API_SECRET_KEY}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_STRIPE_WEBHOOK_SECRET_KEY__|${TASK_CONTAINER_PHP_SEC_STRIPE_WEBHOOK_SECRET_KEY}|" ${file}
    sed -i "s|__TASK_CONTAINER_PHP_SEC_SYMFONY_SECRET__|${TASK_CONTAINER_PHP_SEC_SYMFONY_SECRET}|" ${file}
    sed -i "s|__TASK_CONTAINER_NGINX_IMAGE__|${TASK_CONTAINER_NGINX_IMAGE}|" ${file}
    sed -i "s|__TASK_CONTAINER_NGINX_LOG_GROUP__|${TASK_CONTAINER_NGINX_LOG_GROUP}|" ${file}
    sed -i "s|__TASK_CONTAINER_NGINX_LOG_PREFIX__|${TASK_CONTAINER_NGINX_LOG_PREFIX}|" ${file}
done

echo "Updating $PRE_DEPLOY_TASK_FAMILY task definition..."

aws ecs register-task-definition --cli-input-json file://.ecs/pre_deploy_task_definition.json

echo "Creating $PRE_DEPLOY_TASK_FAMILY task..."

aws ecs run-task --cli-input-json file://.ecs/pre_deploy_task.json

echo "Waiting for $PRE_DEPLOY_TASK_FAMILY task to start running..."

aws ecs wait tasks-running --cluster ${environment}-api --tasks $(aws ecs list-tasks --cluster ${environment}-api --started-by ${PRE_DEPLOY_TASK_STARTED_BY} --query 'taskArns[0]'  --output text)

echo "Waiting for $PRE_DEPLOY_TASK_FAMILY task to finish running..."

aws ecs wait tasks-stopped --cluster ${environment}-api --tasks $(aws ecs list-tasks --cluster ${environment}-api --started-by ${PRE_DEPLOY_TASK_STARTED_BY} --query 'taskArns[0]'  --output text)

echo "Updating $TASK_FAMILY task definition..."

aws ecs register-task-definition --cli-input-json file://.ecs/api_task_definition.json

echo "Updating $TASK_FAMILY service..."

aws ecs update-service --cluster ${environment}-api --service ${environment}-api --task-definition ${TASK_FAMILY}

echo "Waiting for $TASK_FAMILY service to stabilise..."

aws ecs wait services-stable --cluster ${environment}-api --service ${environment}-api

echo "Updating $SQS_QUEUE_PROCESSOR_TASK_FAMILY task definition..."

aws ecs register-task-definition --cli-input-json file://.ecs/api_sqs_queue_processor_task_definition.json

echo "Updating $SQS_QUEUE_PROCESSOR_TASK_FAMILY service..."

aws ecs update-service --cluster ${environment}-api --service ${environment}-api-sqs-queue-processor --task-definition ${SQS_QUEUE_PROCESSOR_TASK_FAMILY}

echo "Waiting for $SQS_QUEUE_PROCESSOR_TASK_FAMILY service to stabilise..."

aws ecs wait services-stable --cluster ${environment}-api --service ${environment}-api-sqs-queue-processor

echo "Updating $EVENT_NOTIFICATION_TASK_FAMILY task definition..."

aws ecs register-task-definition --cli-input-json file://.ecs/event_notification_task_definition.json

echo "Updating $HUBSPOT_SYNC_TASK_FAMILY task definition..."

aws ecs register-task-definition --cli-input-json file://.ecs/hubspot_sync_task_definition.json

echo "Updating $MAILCHIMP_SYNC_TASK_FAMILY task definition..."

aws ecs register-task-definition --cli-input-json file://.ecs/mailchimp_sync_task_definition.json

echo "Updating $SUBSCRIPTION_RENEWAL_NOTIFICATION_TASK_FAMILY task definition..."

aws ecs register-task-definition --cli-input-json file://.ecs/subscription_renewal_notification_task_definition.json
