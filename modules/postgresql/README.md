# PostgreSQL Module

High-performance PostgreSQL database with automated backups and monitoring.

## Features

- 🐘 PostgreSQL 15 with Alpine Linux
- 🔄 Automated daily backups
- 📊 Health checks and monitoring
- 🔧 Performance tuning ready
- 📁 Persistent data storage
- 🚀 Fast startup with init scripts

## Quick Start

1. Configure environment:
   ```bash
   cp .env.template .env
   # Edit .env with your database settings
   ```

2. Create initialization scripts (optional):
   ```bash
   mkdir init
   # Add .sql files to init/ for database setup
   ```

3. Deploy:
   ```bash
   docker-compose up -d
   ```

## Configuration

### Environment Variables

- `POSTGRES_DB`: Database name
- `POSTGRES_USER`: Database user
- `POSTGRES_PASSWORD`: Database password
- `POSTGRES_PORT`: External port mapping
- `BACKUP_SCHEDULE`: Cron schedule for backups
- `BACKUP_RETENTION_DAYS`: How long to keep backups

### Performance Tuning

Edit these variables for your workload:

- `POSTGRES_SHARED_BUFFERS`: Memory for data caching
- `POSTGRES_EFFECTIVE_CACHE_SIZE`: Total memory estimate
- `POSTGRES_WORK_MEM`: Memory per query operation
- `POSTGRES_MAINTENANCE_WORK_MEM`: Memory for maintenance

## Initialization

Place `.sql` or `.sh` files in the `init/` directory to run during first startup:

```sql
-- init/01-create-database.sql
CREATE DATABASE myapp;
CREATE USER myapp_user WITH PASSWORD 'secure_password';
GRANT ALL PRIVILEGES ON DATABASE myapp TO myapp_user;
```

## Backups

Automatic backups are stored in the `postgres_backups` volume:

```bash
# Manual backup
docker exec postgresql-backup /usr/local/bin/backup.sh

# List backups
docker exec postgresql-backup ls -la /backups

# Restore from backup
docker exec -i postgresql psql -U postgres -d stackforge < backup.sql
```

## Connection

```bash
# Connect via psql
docker exec -it postgresql psql -U postgres -d stackforge

# External connection
psql -h localhost -p 5432 -U postgres -d stackforge
```

## Volumes

- `postgres_data`: Database files
- `postgres_backups`: Backup files

## Networks

- `postgres`: Internal network for database communication

## Health Checks

PostgreSQL includes health checks for monitoring:

```bash
# Check status
docker ps
# Look for "healthy" status
```

## Maintainer

Analytics Co., LTD