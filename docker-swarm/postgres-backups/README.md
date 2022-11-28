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