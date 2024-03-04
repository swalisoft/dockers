#!/bin/bash

set -e

source $PWD/.scripts/common.sh

output_info "Running: vendor/bin/php-cs-fixer fix";
docker-compose exec php vendor/bin/php-cs-fixer fix;

output_info "Running: vendor/bin/phpstan analyse";
docker-compose exec php vendor/bin/phpstan analyse;

output_success "Quality check completed.";
