# grafana-prometheus-cadvisor

> Configuration for 1 manager and 2 workers

## Using
```bash
# Create network
docker network create --driver overlay monitoring

# Deploy stack
docker stack deploy -c docker-stack.yml monitoring
```