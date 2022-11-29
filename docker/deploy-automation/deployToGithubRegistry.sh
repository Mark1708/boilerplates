echo "Start deployment to DockerHub"
image_name="ghcr.io/<GITHUB_USER>/$2"

docker build -t ${image_name} -f ./$1/Dockerfile .

if [ -z "$3" ]
then
  echo "No tag"
else
echo "Deploy with tag "$3
  image_with_version="${image_name}:$3"
  docker tag ${image_name} ${image_with_version}
  docker push ${image_with_version}

fi

echo "Deploy with tag latest"
image_with_latest="${image_name}:latest"
docker tag ${image_name} ${image_with_latest}
docker push ${image_with_latest}
echo "Success"
