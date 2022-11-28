# nginx-proxy-manager

## Using
```bash
# Create volume dir
sudo mkdir -p /mnt/nginx
sudo mkdir -p /mnt/letsencrypt
sudo mkdir -p /mnt/nginx-mysql

# Create network
docker network create --driver overlay npm-public

# Deploy service
docker stack deploy -c nginx-proxy-manager.yml npm
```

> Nginx-proxy-manager's default username `admin@example.com` and password: `changeme`