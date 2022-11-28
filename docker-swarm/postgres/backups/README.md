# postgres-backups

## Using
1. In the files `backup.sh` and `backup-cleaner.sh` replace the path to the directory with backups in the `BACKUPS_PATH` variable
2. Running the script `backup.sh`
```bash
sh path/backup.sh <DOCKER_SWARM_SERVICE_NAME> <POSTGRES_DB> <POSTGRES_USER>
```
3. In the file `backup-cleaner.sh` specify the backup storage period in the EXPIRE_DAYS variable
4. Running the script `backup-cleaner.sh`
```bash
sh path/backup-cleaner.sh
```

## Configure scheduled execution
1. `crontab -e`
2. Edit the cron
```bash
# m h  dom mon dow   command
# Every day at 00:00
0 0   *   *   *    sh /path/backup.sh <DOCKER_SWARM_SERVICE_NAME> <POSTGRES_DB> <POSTGRES_USER> > /path/backup.log
# Every day at 00:30
30 0   *   *   *    sh /path/backup-cleaner.sh
```

## And it is possible without automation
### Backup Database
```bash
# Generate sql
docker exec -t <DOCKER_SWARM_SERVICE_NAME> pg_dumpall -c -U <POSTGRES_USER> > dump_$(date +%Y-%m-%d_%H_%M_%S).sql
```

```bash
# Generate compressed backup
docker exec -t <DOCKER_SWARM_SERVICE_NAME> pg_dumpall -c -U <POSTGRES_USER> | gzip > ./dump_$(date +"%Y-%m-%d_%H_%M_%S").gz
```

### Restore Database
```bash
# Restore from sql
cat your_dump.sql | docker exec -i <DOCKER_SWARM_SERVICE_NAME> psql -U <POSTGRES_USER> -d <POSTGRES_DB>
```

```bash
# Restore from compressed sql
gunzip < your_dump.sql.gz | docker exec -i <DOCKER_SWARM_SERVICE_NAME> psql -U <POSTGRES_USER> -d <POSTGRES_DB>
```