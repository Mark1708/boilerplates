# selenium-grid

## Использование
```bash
# Создать сеть
docker network create --driver overlay selenium

# Развернуть стек
docker stack deploy -c selenium.yml selenium
```