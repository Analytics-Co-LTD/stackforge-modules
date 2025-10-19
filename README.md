# StackForge Modules Registry

Git-native module registry for StackForge Docker stack management.

## 📦 Available Modules

This registry contains pre-configured Docker stack modules for common applications and services.

### 🌍 Environments

- **dev**: Development environment modules
- **staging**: Staging environment modules  
- **prod**: Production environment modules

### 📋 Module Structure

Each module contains:
- `stackforge.yml`: Module metadata and configuration
- `docker-compose.yml`: Docker stack definition
- `.env.template`: Environment variables template
- `README.md`: Module documentation

## 🚀 Usage

```bash
# Add module registry to StackForge
stackforge registry add git@github.com:Analytics-Co-LTD/stackforge-modules.git

# List available modules
stackforge modules list

# Install a module
stackforge modules install nginx-proxy

# Deploy module stack
stackforge modules deploy nginx-proxy
```

## 🛠️ Module Development

See [docs/module-development.md](docs/module-development.md) for creating your own modules.

## 📝 License

MIT License - Analytics Co., LTD