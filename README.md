# DevOps Hiring Challenge - Master Submission

This repository is my submission for the DevOps Hiring Challenge, demonstrating a fully automated, self-healing, multi-cloud, multi-region, AI-powered DevOps ecosystem.

## Repository Structure

### Services

All microservices are located in the [`./services`](./services) directory. The project comprises 11 distinct services implemented in various languages, each addressing a specific aspect of a microservices-based e-commerce platform.

| Service                   | Language      | Description                                                                                                                                  | Directory                                                              |
| ------------------------- | ------------- | -------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| **frontend**              | Go            | Exposes an HTTP server to serve the website and automatically generates session IDs for users without requiring signup/login.                | [`./services/frontend`](./services/frontend)                           |
| **cartservice**           | C#            | Manages user shopping carts by storing and retrieving items via Redis.                                                                       | [`./services/cartservice`](./services/cartservice)                     |
| **productcatalogservice** | Go            | Provides a product list from a JSON file, supports product searches, and retrieves individual product details.                               | [`./services/productcatalogservice`](./services/productcatalogservice) |
| **currencyservice**       | Node.js       | Converts currency amounts using real-time data from the European Central Bank; it is the highest QPS service.                                | [`./services/currencyservice`](./services/currencyservice)             |
| **paymentservice**        | Node.js       | Simulates credit card transactions by charging the specified amount and returning a transaction ID.                                          | [`./services/paymentservice`](./services/paymentservice)               |
| **shippingservice**       | Go            | Estimates shipping costs based on the shopping cart and simulates shipping items to a given address.                                         | [`./services/shippingservice`](./services/shippingservice)             |
| **emailservice**          | Python        | Sends out order confirmation emails (mock implementation).                                                                                   | [`./services/emailservice`](./services/emailservice)                   |
| **checkoutservice**       | Go            | Orchestrates the checkout process by retrieving the user's cart, preparing the order, and coordinating payment, shipping, and notifications. | [`./services/checkoutservice`](./services/checkoutservice)             |
| **recommendationservice** | Python        | Provides product recommendations based on the items in the shopping cart.                                                                    | [`./services/recommendationservice`](./services/recommendationservice) |
| **adservice**             | Java          | Serves text ads based on contextual keywords.                                                                                                | [`./services/adservice`](./services/adservice)                         |
| **loadgenerator**         | Python/Locust | Simulates realistic shopping flows by continuously sending requests to the frontend.                                                         | [`./services/loadgenerator`](./services/loadgenerator)                 |

### Scripts

The [`./scripts`](./scripts) directory contains all the necessary scripts for automating various tasks within the project, including building Docker images, deployments, and maintenance operations.

### Helm Charts - `.helm-xnl`

The [`.helm-xnl`](./.helm-xnl) folder contains all the necessary Kubernetes manifests, organized as Helm charts, to deploy and manage the microservices application.  
_For detailed configuration and values, refer to the [Nested README](./.helm-xnl/README.md)._

### Supporting Components

- **Cilium:**  
  Located in [`./cilium`](./cilium), it provides network security and observability for the Kubernetes cluster.

- **Databases:**

  - **ClickHouse**: [`./databases/clickhouse`](./databases/clickhouse)
  - **Loki**: [`./databases/loki`](./databases/loki)
  - **Postgres**: [`./databases/postgres`](./databases/postgres)
  - **Redis**: [`./databases/redis`](./databases/redis)

- **Grafana:**  
  Contains dashboards, Docker Compose configuration, manifests, provisioning files, and documentation for setting up monitoring.  
  Directory: [`./grafana`](./grafana)

- **Litmus:**  
  Chaos engineering tools for simulating failures are located in [`./litmus`](./litmus).

- **Minio:**  
  An object storage solution is available in [`./minio`](./minio).

- **Prometheus:**  
  Includes Docker Compose configuration and a README for setting up metrics collection and alerting.  
  Directory: [`./prometheus`](./prometheus)

## Acknowledgments

This project builds upon the open-source [Google Cloud Platform Microservices Demo](https://github.com/GoogleCloudPlatform/microservices-demo/). Please credit the original project accordingly.
