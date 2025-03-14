# DevOps Hiring Challenge

This repository is my submission for the DevOps Hiring Challenge. It showcases a fully automated, self-healing, multi-cloud, multi-region, and AI-powered DevOps ecosystem built on a microservices architecture. This project not only demonstrates modern cloud-native practices but also serves as a comprehensive example of integrated CI/CD, infrastructure-as-code, and observability.

## Table of Contents

- [Repository Structure](#repository-structure)
- [Services](#services)
- [Supporting Components](#supporting-components)
- [Scripts and Automation](#scripts-and-automation)
- [Helm Charts and Kubernetes](#helm-charts-and-kubernetes)
- [Documentation](#documentation)
- [Getting Started](#getting-started)
- [Acknowledgments](#acknowledgments)

## Repository Structure

The repository is organized into clearly defined directories to separate concerns and simplify management:

- **`services/`**: Contains all microservices for the e-commerce platform. Each service is implemented in different languages (Go, Java, Node.js, Python, C#, etc.) and is responsible for a specific function (e.g., frontend, cart management, catalog, payments).
- **`docs/`**: Holds comprehensive documentation on various topics. For example:
  - [Container Registry](./docs/container_registry.md)
  - [Scripts](./docs/scripts.md)
- **`helm/`**: Includes Helm charts and Kubernetes manifests that allow you to deploy and manage the application in a cloud-native environment.
- **`databases/`**: Contains configuration files for various databases such as ClickHouse, Loki, and Postgres.
- **`grafana/`**, **`prometheus/`**, **`minio/`**: Directories for monitoring, alerting, and storage solutions.
- **`cilium/`**: Provide network security/observability and chaos engineering tools respectively.
- **`scripts/`**: Automation scripts for building images, deploying services, and other maintenance operations.
- **`output.txt`**: Represents logs or output from deployment or testing runs.

_For a complete view of the repository tree, refer to the [output.txt](./output.txt) file._

## Services

The microservices are the backbone of this platform, each addressing distinct business capabilities. Here is a brief overview:

| Service                   | Language      | Description                                                                              | Directory                                                              |
| ------------------------- | ------------- | ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| **frontend**              | Go            | Serves the website and handles user sessions without signup/login.                       | [`./services/frontend`](./services/frontend)                           |
| **cartservice**           | C#            | Manages shopping carts using Redis for quick data retrieval and storage.                 | [`./services/cartservice`](./services/cartservice)                     |
| **productcatalogservice** | Go            | Provides product listings, detailed views, and search capabilities.                      | [`./services/productcatalogservice`](./services/productcatalogservice) |
| **currencyservice**       | Node.js       | Converts currency amounts using real-time exchange rates from the European Central Bank. | [`./services/currencyservice`](./services/currencyservice)             |
| **paymentservice**        | Node.js       | Simulates credit card transactions and returns a transaction ID.                         | [`./services/paymentservice`](./services/paymentservice)               |
| **shippingservice**       | Go            | Estimates shipping costs and simulates the shipping process based on user carts.         | [`./services/shippingservice`](./services/shippingservice)             |
| **emailservice**          | Python        | Sends order confirmation emails (mock implementation).                                   | [`./services/emailservice`](./services/emailservice)                   |
| **checkoutservice**       | Go            | Orchestrates the checkout process including payment, shipping, and notifications.        | [`./services/checkoutservice`](./services/checkoutservice)             |
| **recommendationservice** | Python        | Provides product recommendations based on items in the shopping cart.                    | [`./services/recommendationservice`](./services/recommendationservice) |
| **adservice**             | Java          | Serves context-based advertisements to enhance user engagement.                          | [`./services/adservice`](./services/adservice)                         |
| **loadgenerator**         | Python/Locust | Simulates realistic user traffic to test system resilience and performance under load.   | [`./services/loadgenerator`](./services/loadgenerator)                 |

## Supporting Components

Additional components complement the core services by handling networking, monitoring, chaos testing, and storage:

- **Cilium**: Enhances network security and observability in the Kubernetes cluster.
- **Databases**: Configurations for ClickHouse, Loki, Postgres, and Redis are provided under the `databases/` directory.
- **Grafana & Prometheus**: Tools for monitoring and alerting with pre-configured dashboards.
- **Minio**: Provides object storage capabilities.

## Scripts and Automation

Automation is key in this project. The [`scripts/`](./scripts) directory includes scripts for:

- **Building Docker Images:** (`build-images.sh`)
- **Listing and Tagging Services:** (`list-services.sh`)
- **Maintenance Operations:** (`tapi.sh`)

_For detailed usage of these scripts, refer to the [Scripts Documentation](./docs/scripts.md)._

## Helm Charts and Kubernetes

The `helm/` directory contains all the necessary Helm charts and Kubernetes manifests required to deploy this multi-service application. The charts are organized to simplify deployments across various environments while ensuring consistency and scalability.

_For configuration details and customizations, see the [Helm Charts Documentation](./docs/container_registry.md) and the nested README within the helm folder._

## Documentation

Comprehensive documentation is available to guide you through setup, deployment, and maintenance:

- **Container Registry:** [docs/container_registry.md](./docs/container_registry.md)
- **Scripts:** [docs/scripts.md](./docs/scripts.md)

These documents provide detailed instructions and best practices for managing various aspects of the project.

## Getting Started

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/devops-hiring-challenge.git
   ```

2. **Navigate to the project directory:**

   ```bash
   cd devops-hiring-challenge
   ```

3. **Review the documentation in the [`docs/`](./docs) directory for setup and deployment instructions.**
4. **Deploy the application using Helm:**

   ```bash
   helm install my-release ./helm
   ```

5. **Run the automation scripts as needed to build images and manage services.**

## Acknowledgments

This project is inspired by and builds upon the open-source [Google Cloud Platform Microservices Demo](https://github.com/GoogleCloudPlatform/microservices-demo/). Please credit the original project where appropriate.
