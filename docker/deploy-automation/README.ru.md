# deploy-automation

## Использование
### Деплой на DockerHub
1. Замените <DOCKERHUB_USER> в `deployToDockerHub.sh`
2. Запускаем скрипт `deployToDockerHub.sh`
```bash
sh path/deployToDockerHub.sh <PROJECT_FOLDER> <IMAGE_NAME> <IMAGE_TAG>
```

### Деплой на Github Registry
1. Замените <GITHUB_USER> в `deployToGithubRegistry.sh`
2. Запускаем скрипт `deployToGithubRegistry.sh`
```bash
sh path/deployToGithubRegistry.sh <PROJECT_FOLDER> <IMAGE_NAME> <IMAGE_TAG>
```