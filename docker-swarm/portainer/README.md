# portainer

## Using
```bash
#Create volume dir
sudo mkdir -p /mnt/portainer

# Create network
docker network create --driver overlay portainer

# Deploy service
docker stack deploy -c portainer.yml portainer
```