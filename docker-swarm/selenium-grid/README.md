# selenium-grid

## Using
```bash
# Create network
docker network create --driver overlay selenium

# Deploy service
docker stack deploy -c selenium.yml selenium
```