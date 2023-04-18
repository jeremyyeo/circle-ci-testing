#!/bin/bash
set -eo pipefail

cd integration_tests

if [[ ! -e ~/.dbt/profiles.yml ]]; then
    echo "Copying sample profile"
    mkdir -p ~/.dbt
    cp ci/sample.profiles.yml ~/.dbt/profiles.yml
fi

echo "Starting integration tests"
dbt run --target $1
