# Grafana Configuration

This folder contains the configuration files necessary to set up Grafana for monitoring the microservices application. It includes pre-configured dashboards, data source definitions, and provisioning files to streamline deployment and dashboard management.

## What’s Included

- **Dashboard JSON Files:**  
  Pre-built dashboards for visualizing metrics from Prometheus, logs from Loki, and traces from OpenTelemetry.

- **Data Source Configurations:**  
  YAML files to automatically configure Grafana with the necessary data sources such as Prometheus and Loki.

- **Provisioning Files:**  
  Files to automate the provisioning of dashboards and data sources when Grafana starts up, ensuring a consistent setup across environments.

## Getting Started

1. **Install Grafana:**  
   Follow the [official Grafana installation guide](https://grafana.com/docs/grafana/latest/installation/) to install Grafana on your system or container.

2. **Configure Data Sources:**

   - Navigate to the `provisioning/datasources` folder.
   - Update the configuration files with the correct endpoints for your Prometheus and Loki instances.

3. **Import Dashboards:**

   - You can either import the JSON files manually via the Grafana UI or configure automatic dashboard provisioning by placing the JSON files in the `provisioning/dashboards` directory.
   - Ensure that the provisioning configuration points to the correct dashboard folder.

4. **Start Grafana:**  
   Launch Grafana. The provisioning mechanism will automatically set up the configured data sources and dashboards, allowing you to start monitoring your system immediately.

### Customization

- Modify the dashboard JSON files to tailor visualizations to your specific monitoring needs.
- Update data source configuration files if your monitoring stack changes (e.g., new endpoints or additional data sources).

These configurations are designed to help you quickly deploy a fully functional monitoring dashboard that gives you real-time insights into system performance and health.
