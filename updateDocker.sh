#! /usr/bin/bash

git pull

# docker hub username
USERNAME=badnarrators
# image name
IMAGE=BadUtils
# program version
version=`cat VERSION`
echo "username: $USERNAME"
echo "image: $IMAGE"
echo "version: $version"

docker build -t $USERNAME/$IMAGE:$version .
docker stop $IMAGE
docker rm $IMAGE
docker run -d --rm -p 5345:3000 --name $IMAGE $USERNAME/$IMAGE:$version
docker tag $USERNAME/$IMAGE:$version $USERNAME/$IMAGE:latest