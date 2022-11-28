# postgres

## Using
```bash
# Create volume dir
sudo mkdir -p /mnt/db-data

# Create label
docker node update --label-add db=true ID

# Create network
docker network create --driver overlay backend

# Deploy service
docker stack deploy -c postgres.yml postgres
```