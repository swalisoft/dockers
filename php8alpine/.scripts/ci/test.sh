#!/bin/sh

set -euo pipefail;

cat > docker-compose.yml <<EOF
version: "3.7"
services:
  php:
    image: app-test:${CI_COMMIT_SHA}
    environment:
      API_HOSTNAME: "http://example.com"
      AWS_REGION: ""
      AWS_STORAGE_BUCKET_PUBLIC: ""
      AWS_STORAGE_BUCKET_PRIVATE: ""
      AWS_STORAGE_BUCKET_PRIVATE_KMS_KEY_ID: ""
      AWS_TRANSCODING_ENVIRONMENT: ""
      DEFAULT_FROM_EMAIL_ADDRESS: "test@example.com"
      DATABASE_HOST: "postgresql-test"
      DATABASE_PORT: 5432
      DATABASE_NAME: "perfectly_spoken_test"
      DATABASE_USER: "perfectly_spoken_test"
      DATABASE_PASSWORD: "perfectly_spoken_test"
      ELASTICSEARCH_HOST: "elasticsearch"
      ELASTICSEARCH_PORT: "9200"
      ELASTICSEARCH_TRANSPORT: "Http"
      ELASTICSEARCH_AUTH: ""
      FILESYSTEM_PUBLIC: "local_filesystem"
      FILESYSTEM_PRIVATE: "local_filesystem"
      JWT_HMAC_KEY: "$(openssl rand -base64 64)"
      MAILER_HOST: "mailcatcher"
      MAILER_PORT: 1025
      RECAPTCHA_SECRET_KEY: ""
      SYMFONY_SECRET: "$(openssl rand -base64 32)"
      STRIPE_API_BASE: "http://stripemock:12111"
      STRIPE_API_SECRET_KEY: "sk_test_123"
      STRIPE_WEBHOOK_SECRET_KEY: "stripe_webhook_secret_key"
      MAILCHIMP_API_KEY: "mailchimp_api-key"
      MAILCHIMP_AUDIENCE_ID: "mailchimp_audience_id"
      HUBSPOT_API_KEY: "hubspot_api_key"
      WEB_INTERFACE_ADMIN_URL: "http://admin.example.com"
      WEB_INTERFACE_STUDENT_URL: "http://student.example.com"
      WEB_INTERFACE_TEAM_URL: "http://{subdomain}.example.team"
    links:
      - mailcatcher
      - postgresql-test
      - stripemock
      - elasticsearch
  mailcatcher:
    image: schickling/mailcatcher
  postgresql-test:
    image: postgres:9.6-alpine
    environment:
      POSTGRES_USER: "perfectly_spoken_test"
      POSTGRES_PASSWORD: "perfectly_spoken_test"
      POSTGRES_DB: "perfectly_spoken_test"
    volumes:
      - type: tmpfs
        target: /var/lib/postgresql/data
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:7.17.0
    container_name: elasticsearch
    environment:
      - xpack.security.enabled=false
      - discovery.type=single-node
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
    ulimits:
      memlock:
        soft: -1
        hard: -1
      nofile:
        soft: 65536
        hard: 65536
    cap_add:
      - IPC_LOCK
    volumes:
      - elasticsearch:/usr/share/elasticsearch/data
    ports:
      - 9200:9200
  selenium:
    image: selenium/standalone-chrome-debug:3.141.59-xenon
    networks:
      - default
      - perfectly-spoken-frontend
    ports:
      - "4444:4444"
    volumes:
      - type: tmpfs
        target: /dev/shm
      - type: tmpfs
        target: /tmp
  stripemock:
    image: stripemock/stripe-mock:v0.101.0
volumes:
  elasticsearch:
networks:
  perfectly-spoken-frontend:
    name: perfectly_spoken_frontend
EOF

docker load -i images/app-test.tar

docker-compose up -d

sleep 10

echo "Enabling UUID extension...";

docker exec $(docker-compose ps -q postgresql-test) /bin/sh -c 'PGPASSWORD=perfectly_spoken_test psql -U perfectly_spoken_test -d perfectly_spoken_test -c "CREATE EXTENSION \"uuid-ossp\";"'

echo "Validating GraphQL schema...";

docker exec $(docker-compose ps -q php) /bin/sh -c 'bin/console app:graphql:validate-schema'

echo "Building Codeception...";

docker exec $(docker-compose ps -q php) /bin/sh -c './vendor/bin/codecept build'

echo "Running all test suites...";

exit_code=0

docker exec $(docker-compose ps -q php) /bin/sh -c 'SYMFONY_DEPRECATIONS_HELPER=disabled ./vendor/bin/codecept run api,cli,unit --no-colors' || exit_code=$?

if [ $exit_code -eq 1 ]; then
  docker cp $(docker-compose ps -q php):/var/www/tests/_output app/src/tests/_output
fi

exit $exit_code
