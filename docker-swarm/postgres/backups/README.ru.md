# postgres-backups

## Использование
1. В файлах `backup.sh` и `backup-cleaner.sh` замените путь к каталогу с резервными копиями в переменной `BACKUPS_PATH`
2. Запуск скрипта `backup.sh`
```bash
sh path/backup.sh <DOCKER_SWARM_SERVICE_NAME> <POSTGRES_DB> <POSTGRES_USER>
```
3. В файле `backup-cleaner.sh ` укажите период хранения резервной копии в переменной `EXPIRE_DAYS`
4. Запуск скрипта `backup-cleaner.sh`
```bash
sh path/backup-cleaner.sh
```

## Настройка запланированного выполнения
1. `crontab -e`
2. Редактируем cron
```bash
# m h  dom mon dow   command
# Каждый день в 00:00
0 0   *   *   *    sh /path/backup.sh <DOCKER_SWARM_SERVICE_NAME> <POSTGRES_DB> <POSTGRES_USER> > /path/backup.log
# Каждый день в 00:30
30 0   *   *   *    sh /path/backup-cleaner.sh
```

## Также это возможно без автоматизации
### Резервная копия базы данных
```bash
# Генерация sql
docker exec -t <DOCKER_SWARM_SERVICE_NAME> pg_dumpall -c -U <POSTGRES_USER> > dump_$(date +%Y-%m-%d_%H_%M_%S).sql
```

```bash
# Генерация сжатого sql
docker exec -t <DOCKER_SWARM_SERVICE_NAME> pg_dumpall -c -U <POSTGRES_USER> | gzip > ./dump_$(date +"%Y-%m-%d_%H_%M_%S").gz
```

### Восстановление базы данных
```bash
# Восстановить из sql
cat your_dump.sql | docker exec -i <DOCKER_SWARM_SERVICE_NAME> psql -U <POSTGRES_USER> -d <POSTGRES_DB>
```

```bash
# Восстановить из сжатого sql
gunzip < your_dump.sql.gz | docker exec -i <DOCKER_SWARM_SERVICE_NAME> psql -U <POSTGRES_USER> -d <POSTGRES_DB>
```