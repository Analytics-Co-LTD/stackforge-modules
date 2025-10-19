# n8n Workflow Automation Module

Powerful workflow automation platform with visual editor for connecting apps and services.

## Features

- 📊 Visual workflow editor
- 🔗 400+ integrations
- 🔄 Real-time and scheduled execution
- 🐖 Docker container support
- 📊 Webhook endpoints
- 🔒 Basic authentication
- 💾 SQLite or PostgreSQL database
- 🌐 SSL-ready with nginx-proxy

## Quick Start

1. Configure environment:
   ```bash
   cp .env.template .env
   # Edit .env with your settings
   ```

2. Deploy:
   ```bash
   docker-compose up -d
   ```

3. Access n8n:
   ```
   http://localhost:5678
   ```

## Configuration

### Basic Authentication

- `N8N_BASIC_AUTH_ACTIVE`: Enable basic auth
- `N8N_BASIC_AUTH_USER`: Username
- `N8N_BASIC_AUTH_PASSWORD`: Password

### Host Settings

- `N8N_HOST`: Domain name
- `N8N_PORT`: Port number
- `N8N_PROTOCOL`: http or https
- `WEBHOOK_URL`: Base URL for webhooks

### Database Options

#### SQLite (Default)
```bash
DB_TYPE=sqlite
DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite
```

#### PostgreSQL
```bash
DB_TYPE=postgresdb
DB_POSTGRESDB_HOST=postgres
DB_POSTGRESDB_PORT=5432
DB_POSTGRESDB_DATABASE=n8n
DB_POSTGRESDB_USER=n8n
DB_POSTGRESDB_PASSWORD=changeme123!
```

## Integration with Other Modules

### With nginx-proxy

1. Connect to proxy network:
   ```yaml
   networks:
     - n8n
     - proxy  # Add this line
   ```

2. Configure domain in `.env`:
   ```bash
   N8N_HOST=n8n.example.com
   N8N_PROTOCOL=https
   WEBHOOK_URL=https://n8n.example.com
   ```

### With PostgreSQL

1. Deploy PostgreSQL module first
2. Update n8n configuration:
   ```bash
   DB_TYPE=postgresdb
   DB_POSTGRESDB_HOST=postgres
   # ... other PostgreSQL settings
   ```

## Common Workflows

### API Integration
- Connect REST APIs
- Transform data between services
- Sync databases

### Automation
- Monitor file changes
- Process webhooks
- Schedule tasks

### Notifications
- Send emails/SMS
- Slack/Discord alerts
- Error monitoring

## Development

### Custom Nodes

Mount custom nodes directory:
```yaml
volumes:
  - ./custom-nodes:/home/node/.n8n/custom
```

### Environment Variables

```bash
# Enable debug mode
N8N_LOG_LEVEL=debug

# Disable production optimizations
N8N_DISABLE_PRODUCTION_MAIN_PROCESS=true
```

## Security

- Always change default passwords
- Use HTTPS in production
- Limit network access
- Regular backups of workflow data

## Backup & Restore

### Export Workflows
```bash
# Backup workflows
docker exec n8n n8n export:workflow --backup --output=/tmp/workflows.json

# Restore workflows
docker exec -i n8n n8n import:workflow --input=/tmp/workflows.json
```

### Database Backup
```bash
# SQLite backup
docker cp n8n:/home/node/.n8n/database.sqlite ./n8n-backup.sqlite

# PostgreSQL backup (if using PostgreSQL module)
docker exec postgresql-backup /usr/local/bin/backup.sh
```

## Troubleshooting

### Common Issues

1. **Permission errors**: Check volume permissions
2. **Database connection**: Verify PostgreSQL module is running
3. **Webhook issues**: Check WEBHOOK_URL configuration
4. **Memory issues**: Increase Docker memory limits

### Logs
```bash
# View logs
docker logs n8n

# Follow logs
docker logs -f n8n
```

## Volumes

- `n8n_data`: Workflow data and configuration

## Networks

- `n8n`: Internal network
- `proxy`: External network (for nginx-proxy)

## Maintainer

Analytics Co., LTD