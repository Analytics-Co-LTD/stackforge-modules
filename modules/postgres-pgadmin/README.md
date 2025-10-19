# Postgres + pgAdmin Module

This module deploys a PostgreSQL database alongside pgAdmin UI.

- Services: `dwh_db` (postgres:15), `pgadmin` (dpage/pgadmin4)
- External network: `stackanalytics_net` (must exist)
- Named volumes: `dwh_db_data`, `pgadmin_data`

## Environment variables (.env)

Template is Jinja-enabled and supports PROMPT tags. Key variables:
- POSTGRES_DB, POSTGRES_USER, POSTGRES_PASSWORD (secret)
- PGADMIN_DEFAULT_EMAIL (required), PGADMIN_DEFAULT_PASSWORD (secret)
- DWH_DB_PORT (default 5433), PGADMIN_PORT (default 5050)
- Memory limits/reservations for each service

Refer to StackForge Jinja guide for details.
