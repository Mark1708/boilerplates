# postgres

## Использование
```bash
# Создать каталог томов
sudo mkdir -p /mnt/db-data

# Создать ярлык
docker node update --label-add db=true ID

# Создать сеть
docker network create --driver overlay backend

# Развернуть стек
docker stack deploy -c postgres.yml postgres
```