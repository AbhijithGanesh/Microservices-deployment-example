# Databases Configuration Documentation

This document details the database configurations for the DevOps Hiring Challenge project. The databases provide essential storage, analytics, and logging capabilities to support the microservices ecosystem.

## Overview

The project includes configurations for three primary databases:

- **ClickHouse**: A high-performance, column-oriented database for analytical workloads.
- **Loki**: A log aggregation system designed for efficient log collection and querying.
- **Postgres**: A robust relational database management system.

## Configuration Files

These files are located in the `databases/` directory:

- **clickhouse.yaml**: Kubernetes manifest for deploying ClickHouse.
- **loki.yaml**: Deployment details for Loki.
- **postgres.yaml**: Configuration for deploying PostgreSQL.

## Customization

- **Environment Variables**: Modify environment settings as needed in each YAML file.
- **Resource Limits**: Adjust CPU and memory requests/limits based on your workload.
- **Storage Configuration**: Ensure that persistent volumes and storage classes are correctly set up to meet your data retention and performance needs.

## Deployment

Apply the database configurations with:

```bash
kubectl apply -f databases/clickhouse.yaml
kubectl apply -f databases/loki.yaml
kubectl apply -f databases/postgres.yaml
```

## Troubleshooting

- Verify that the pods are running with `kubectl get pods`.
- For debugging, inspect pod logs using `kubectl logs <pod-name>`.
- Confirm that persistent volumes are bound correctly and meet the storage requirements.
