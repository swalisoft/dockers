#!/bin/bash

set -e

source $PWD/.scripts/common.sh

output_info "Building base image...";

(docker build -t php8-api-base .);

output_success "Application build completed.";
