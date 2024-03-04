#!/bin/bash

set -e

source $PWD/.scripts/common.sh

output_info "Deleting filesystem";
rm -rf app/src/storage

output_info "Building email assets";
(cd app/src/resources/email && docker-compose run node /bin/sh -c 'cd /home/node/email && npm install && npm run build');

output_info "Running: bin/console cache:clear";
docker-compose exec php bin/console cache:clear --no-interaction --no-debug || true;

output_info "Running: composer install";
docker-compose exec php composer install;

output_info "Reinitialising the database...";
docker-compose exec php /bin/sh -c 'php bin/console doctrine:query:sql "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";" --no-debug && php bin/console doctrine:schema:drop --full-database --force --no-debug'

output_info "Running: bin/console doctrine:migrations:migrate";
docker-compose exec php bin/console doctrine:migrations:migrate --no-interaction --no-debug;

output_info "Running: bin/console app:data-migration:migrate";
docker-compose exec php bin/console app:data-migration:migrate --no-interaction --no-debug;

output_info "Running: bin/console app:generate:sample";
docker-compose exec php php -d memory_limit=-1 bin/console app:generate:sample --no-interaction --no-debug;

output_info "Creating Elasticsearch pipeline";
curl -X DELETE "localhost:9200/_ingest/pipeline/geoip" || true;
curl -X PUT "localhost:9200/_ingest/pipeline/geoip?pretty" -H 'Content-Type: application/json' -d'
{
  "processors" : [
    {
      "geoip" : {
        "ignore_missing": true,
        "field" : "ipAddress"
      }
    }
  ]
}
';

output_info "Running: bin/console fos:elastica:populate";
docker-compose exec php bin/console fos:elastica:populate --no-interaction --no-debug;

output_info "Running: ./vendor/bin/codecept bootstrap";
docker-compose exec php ./vendor/bin/codecept bootstrap || true;

output_info "Running: ./vendor/bin/codecept build";
docker-compose exec php ./vendor/bin/codecept build;

output_success "Application initialisation completed.";
