# selenium-grid

## Using
```bash
# Create network
docker network create --driver overlay selenium

# Deploy stack
docker stack deploy -c selenium.yml selenium
```