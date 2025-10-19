# Nginx Proxy Module

Reverse proxy with automatic SSL certificate management using Let's Encrypt.

## Features

- 🔄 Automatic reverse proxy for Docker containers
- 🔒 Automatic SSL certificate generation with Let's Encrypt
- 🌐 Multi-domain support
- 📱 WebSocket support
- 🔧 Easy configuration via environment variables

## Quick Start

1. Create proxy network:
   ```bash
   docker network create proxy
   ```

2. Configure environment:
   ```bash
   cp .env.template .env
   # Edit .env with your settings
   ```

3. Deploy:
   ```bash
   docker-compose up -d
   ```

## Configuration

### Environment Variables

- `DEFAULT_HOST`: Default host for proxy
- `LETSENCRYPT_EMAIL`: Email for Let's Encrypt certificates
- `TRUST_DOWNSTREAM_PROXY`: Trust proxy headers

### Adding Services

To proxy a service, add these labels to your container:

```yaml
labels:
  - "VIRTUAL_HOST=myapp.example.com"
  - "LETSENCRYPT_HOST=myapp.example.com"
  - "LETSENCRYPT_EMAIL=admin@example.com"
networks:
  - proxy
```

## Volumes

- `nginx_certs`: SSL certificates
- `nginx_html`: Web root for challenges
- `nginx_dhparam`: DH parameters
- `acme`: ACME challenge data

## Networks

- `proxy`: External network for container communication

## Ports

- `80`: HTTP traffic
- `443`: HTTPS traffic

## Maintainer

Analytics Co., LTD