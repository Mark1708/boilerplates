# portainer

## Использование
```bash
# Создать каталог томов
sudo mkdir -p /mnt/portainer

# Создать сеть
docker network create --driver overlay portainer

# Развернуть стек
docker stack deploy -c portainer.yml portainer
```