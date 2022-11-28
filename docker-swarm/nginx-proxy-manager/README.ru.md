# nginx-proxy-manager

## Использование
```bash
# Создать каталог томов
sudo mkdir -p /mnt/nginx
sudo mkdir -p /mnt/letsencrypt
sudo mkdir -p /mnt/nginx-mysql

# Создать сеть
docker network create --driver overlay npm-public

# Развернуть стек
docker stack deploy -c nginx-proxy-manager.yml npm
```

> Nginx-proxy-manager - имя пользователя по умолчанию: `admin@example.com` и пароль: `changeme`