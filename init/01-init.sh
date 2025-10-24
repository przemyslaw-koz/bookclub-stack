#!/usr/bin/env bash
set -euo pipefail

psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
  CREATE USER bookwyrm WITH PASSWORD '${BOOKWYRM_DB_PASSWORD}';
  CREATE DATABASE bookwyrm OWNER bookwyrm;
  GRANT ALL PRIVILEGES ON DATABASE bookwyrm TO bookwyrm;

  CREATE USER discourse WITH PASSWORD '${DISCOURSE_DB_PASSWORD}';
  CREATE DATABASE discourse OWNER discourse;
  GRANT ALL PRIVILEGES ON DATABASE discourse TO discourse;
EOSQL

