#!/bin/bash
# PostgreSQL Backup Script

set -e

BACKUP_DIR="/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/postgres_backup_${TIMESTAMP}.sql"
RETENTION_DAYS=${BACKUP_RETENTION_DAYS:-7}

echo "[$(date)] Starting PostgreSQL backup..."

# Create backup directory
mkdir -p $BACKUP_DIR

# Create backup
echo "[$(date)] Creating backup: $BACKUP_FILE"
pg_dump -h $POSTGRES_HOST -U $POSTGRES_USER -d $POSTGRES_DB > $BACKUP_FILE

# Compress backup
echo "[$(date)] Compressing backup..."
gzip $BACKUP_FILE

# Clean old backups
echo "[$(date)] Cleaning backups older than $RETENTION_DAYS days..."
find $BACKUP_DIR -name "postgres_backup_*.sql.gz" -mtime +$RETENTION_DAYS -delete

echo "[$(date)] Backup completed: ${BACKUP_FILE}.gz"
echo "[$(date)] Available backups:"
ls -la $BACKUP_DIR/postgres_backup_*.sql.gz 2>/dev/null || echo "No backups found"