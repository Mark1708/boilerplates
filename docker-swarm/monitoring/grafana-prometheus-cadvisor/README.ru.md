# grafana-prometheus-cadvisor

> Конфигурация для 1 менеджера и 2 работников

## Использование
```bash
# Create network
docker network create --driver overlay monitoring

# Deploy service
docker stack deploy -c docker-stack.yml monitoring
```