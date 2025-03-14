#!/bin/bash

SERVICES_DIR="services"
DOCKERFILES=()
count=0

if [ -d "$SERVICES_DIR" ]; then
    echo "Iterating through folders in $SERVICES_DIR:"
    
    for folder in "$SERVICES_DIR"/*/; do
        if [ -d "$folder" ]; then
            echo "Found folder: $(basename "$folder")"
            
            if [ -f "$folder/Dockerfile" ]; then
                echo "  Dockerfile exists in $(basename "$folder")"
                DOCKERFILES+=("$folder/Dockerfile")
            else
                echo "  No Dockerfile found in $(basename "$folder")"
            fi
        fi
    done
fi

echo "Building docker images"
for dockerfile in "${DOCKERFILES[@]}"; do
    count=$((count+1))
    image_name="svc_${count}_$(basename "$(dirname "$dockerfile")")"
    echo "docker tag $image_name ghcr.io/abhijithganesh/$image_name:latest"
    # docker push "ghcr.io/abhijithganesh/$image_name:latest"
done
