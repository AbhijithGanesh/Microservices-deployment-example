# DevOps Hiring Challenge - Dev Branch

This repository is my submission for the DevOps Hiring Challenge, demonstrating a fully automated, self-healing, multi-cloud, multi-region, AI-powered DevOps ecosystem.

## Repository Structure

### Services

All microservices are located in the `./src` directory. This project comprises 11 distinct services implemented in various languages. You can also find the Protocol Buffers definitions in the [`./protos`](./protos) directory.

| Service                                             | Language      | Description                                                                                                                                  |
| --------------------------------------------------- | ------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| [frontend](/src/frontend)                           | Go            | Exposes an HTTP server to serve the website. Automatically generates session IDs for all users without requiring signup/login.               |
| [cartservice](/src/cartservice)                     | C#            | Manages the user's shopping cart by storing and retrieving items using Redis.                                                                |
| [productcatalogservice](/src/productcatalogservice) | Go            | Provides a list of products from a JSON file, supports product searches, and retrieves individual product details.                           |
| [currencyservice](/src/currencyservice)             | Node.js       | Converts currency amounts using real-time data from the European Central Bank. This is the highest QPS service.                              |
| [paymentservice](/src/paymentservice)               | Node.js       | Simulates credit card transactions by charging a provided amount and returning a transaction ID.                                             |
| [shippingservice](/src/shippingservice)             | Go            | Estimates shipping costs based on the shopping cart and simulates shipping items to a given address.                                         |
| [emailservice](/src/emailservice)                   | Python        | Sends out order confirmation emails (mock implementation).                                                                                   |
| [checkoutservice](/src/checkoutservice)             | Go            | Orchestrates the checkout process by retrieving the user's cart, preparing the order, and coordinating payment, shipping, and notifications. |
| [recommendationservice](/src/recommendationservice) | Python        | Provides product recommendations based on the items in the shopping cart.                                                                    |
| [adservice](/src/adservice)                         | Java          | Serves text ads based on contextual keywords.                                                                                                |
| [loadgenerator](/src/loadgenerator)                 | Python/Locust | Simulates realistic shopping flows by continuously sending requests to the frontend.                                                         |

### Scripts

This folder contains all the necessary scripts for automating various tasks within the project, including deployment, testing, and maintenance operations.

### Helm Charts - `.helm-xnl`

This folder contains all the necessary Kubernetes manifests, organized as Helm charts, to deploy and manage the microservices application.

#### Note

Refer to the [Nested Readme](./.helm-xnl/README.md) for detailed context of values

## Acknowledgments

This project builds upon the open-source [Google Cloud Platform Microservices Demo](https://github.com/GoogleCloudPlatform/microservices-demo/). Please credit the original project accordingly.
