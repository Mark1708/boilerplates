1. `export KEYCLOAK_DOMAIN=keycloak.example.com`
2. 
```shell
sudo mkdir -p /var/data/runtime/keycloak/database
sudo mkdir -p /var/data/keycloak/database-dump
```
3. `docker stack deploy -c keycloak.yml keycloak`
