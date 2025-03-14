#!/bin/bash

SERVICES_DIR="services"
DOCKERFILES=()
count=0

if [ -d "$SERVICES_DIR" ]; then
    echo "Iterating through folders in $SERVICES_DIR:"
    
    for folder in "$SERVICES_DIR"/*/; do
        if [ -d "$folder" ]; then
            folderName=$(basename "$folder")
            echo "Found folder: $folderName"
            
            if [ -f "$folder/Dockerfile" ]; then
                echo "  Dockerfile exists in $folderName"
                DOCKERFILES+=("$folder/Dockerfile")
            elif [ -f "$folder/src/Dockerfile" ]; then
                echo "  Dockerfile exists in $folderName/src"
                DOCKERFILES+=("$folder/src/Dockerfile")
            else
                echo "  No Dockerfile found in $folderName"
            fi
        fi
    done
fi

echo "Building docker images"
for dockerfile in "${DOCKERFILES[@]}"; do
    count=$((count+1))
    image_name="svc_${count}_$(basename "$(dirname "$dockerfile")")"
    echo "docker tag $image_name ghcr.io/abhijithganesh/$image_name:latest"
    docker push "ghcr.io/abhijithganesh/$image_name:latest"
done
