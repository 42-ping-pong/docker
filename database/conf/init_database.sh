#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE DATABASE $NEW_DATABASE_NAME;
  CREATE USER $NEW_POSTGRES_USER PASSWORD '$NEW_POSTGRES_PASSWORD';
  ALTER USER $NEW_POSTGRES_USER CONNECTION LIMIT -1;
  ALTER USER $NEW_POSTGRES_USER SUPERUSER;
EOSQL

# EOSQL