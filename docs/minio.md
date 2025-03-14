# Minio Documentation

This document provides detailed information about the Minio configuration used as an object storage solution in this project.

## Overview

Minio offers scalable and reliable object storage, essential for storing files, images, and other binary data. It is deployed as a StatefulSet to ensure data persistence and stability.

## Files and Configuration

The Minio configuration is contained in the `minio/` directory:

- **minio-sts.yaml**: Defines the Kubernetes StatefulSet for Minio.
- **minio-svc.yaml**: Provides the service definition to expose the Minio StatefulSet.
- **README.md**: Additional instructions specific to Minio usage (if available).

## Customization

- **Storage Settings**: Update volume sizes and storage class parameters in `minio-sts.yaml` to match your environment.
- **Service Exposure**: Adjust the service type (ClusterIP, NodePort, or LoadBalancer) in `minio-svc.yaml` based on your access requirements.
- **Security and Access**: Configure authentication and access policies to secure your object storage.

## Deployment

Deploy Minio with the following commands:

```bash
kubectl apply -f minio/minio-sts.yaml
kubectl apply -f minio/minio-svc.yaml
```

## Troubleshooting

- Verify the StatefulSet status with `kubectl get statefulsets`.
- Check the logs of Minio pods using `kubectl logs <minio-pod-name>`.
- Ensure that persistent volumes are properly configured and bound.
