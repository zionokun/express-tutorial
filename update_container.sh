#!/bin/bash

CONTAINER_NAME="express"
DOCKERHUB_USERNAME="zekunokun"  

while true; do
    # Pull the latest image from Docker Hub
    docker pull $DOCKERHUB_USERNAME/node-docker:latest
    
    # Check if there's a newer image
    if docker inspect --format='{{.Id}}' $CONTAINER_NAME | grep -q $(docker inspect --format='{{.Id}}' $DOCKERHUB_USERNAME/node-docker:latest); then
        echo "Container is up to date."
    else
        echo "New image available. Restarting container..."
        docker stop $CONTAINER_NAME
        docker rm $CONTAINER_NAME
        docker run -d --restart always --name $CONTAINER_NAME -p 3000:3000 $DOCKERHUB_USERNAME/node-docker:latest
    fi
    
    # Sleep for a while before checking for updates again (e.g., every hour)
    sleep 3600
done
