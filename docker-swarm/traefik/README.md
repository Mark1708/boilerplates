1. `docker network create --driver=overlay traefik-public`
2. `export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')`
3. `docker node update --label-add traefik-public.traefik-public-certificates=true $NODE_ID`
4. `export EMAIL=admin@example.com`
5. `export DOMAIN=traefik.example.com`
6. `export USERNAME=admin`
7. `export HASHED_PASSWORD=$(openssl passwd -apr1)`
8. `echo $HASHED_PASSWORD`
9. `docker stack deploy -c traefik.yml traefik`

