# Helm Chart Documentation

This document provides an in-depth overview of the Helm charts used for deploying the microservices application, including instructions, structure, and customization guidelines.

## Overview

The Helm charts in this project are located in the `helm/` directory. They enable you to manage Kubernetes deployments, services, ConfigMaps, and network policies for all microservices in a streamlined and scalable manner.

## Structure

- **Chart.yaml**: Contains metadata about the Helm chart.
- **values.yaml**: Defines default configuration values for deploying the application.
- **templates/**: Directory containing Kubernetes resource templates for:
  - Deployments
  - ConfigMaps
  - Network Policies
  - Service definitions
- **charts/**: Directory for dependent or nested charts.

## Customization

Customize the deployment by editing the `values.yaml` file:

- **Service Configuration**: Adjust resource limits, replicas, environment variables, and other service-specific parameters.
- **Networking**: Modify ingress configurations, service types, and network policies.
- **Secrets and ConfigMaps**: Override default settings by updating ConfigMaps or injecting your secrets securely.

## Deployment Instructions

1. **Package the Chart (Optional):**

   ```bash
   helm package helm/
   ```

2. **Install the Chart:**

   ```bash
   helm install my-release helm/
   ```

3. **Upgrade the Deployment:**

   ```bash
   helm upgrade my-release helm/
   ```

4. **Uninstall the Release:**

   ```bash
   helm uninstall my-release
   ```

## Troubleshooting

- Use `helm status my-release` to inspect the release status.
- Render the templates locally with `helm template helm/` to debug issues.
- Check pod logs via `kubectl logs <pod-name>` for additional insights.
