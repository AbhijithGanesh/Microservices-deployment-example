# Docker Scripts Documentation

This document provides an overview of the Docker-related scripts in the repository. These scripts automate the process of discovering, building, tagging, and pushing Docker images for each microservice in the project.

---

## Overview

The repository contains three key scripts that work together to manage Docker images:

1. **Dockerfile Listing Script**  
   Iterates through the `services` directory, identifies folders containing a `Dockerfile`, and collects their paths.

2. **Docker Image Build Script**  
   Uses the collected Dockerfile paths to build Docker images. Each image is tagged with a name based on a sequential count and the service folder name.

3. **Tag and Push Script**  
   Tags the pre-built Docker images with the appropriate GitHub Container Registry (GHCR) format and pushes them to GHCR.

---

## Script Details

### 1. Dockerfile Listing Script

This script checks each subdirectory in the `services` folder for the presence of a `Dockerfile`. If a Dockerfile is found, its path is added to an array. The script then prints the names of the folders and indicates whether a Dockerfile was detected.

```bash
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
```
