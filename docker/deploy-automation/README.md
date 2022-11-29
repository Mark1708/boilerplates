# deploy-automation

## Using
### Deploy to DockerHub
1. Replace <DOCKERHUB_USER> in `deployToDockerHub.sh`
2. Running the script `deployToDockerHub.sh`
```bash
sh path/deployToDockerHub.sh <PROJECT_FOLDER> <IMAGE_NAME> <IMAGE_TAG>
```
### Deploy to Github Registry
1. Replace <GITHUB_USER> in `deployToGithubRegistry.sh`
2. Running the script `deployToGithubRegistry.sh`
```bash
sh path/deployToGithubRegistry.sh <PROJECT_FOLDER> <IMAGE_NAME> <IMAGE_TAG>
```