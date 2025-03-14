# GitHub Actions Workflows

This repository uses GitHub Actions to automate various tasks. Below is a list of all workflows and their purposes:

## Workflows

### 1. **Build and Test**

- **File**: `.github/workflows/build-and-test.yml`
- **Purpose**: Automates the build and testing process for the project.
- **Triggers**:
  - On every push to the `main` branch.
  - On pull requests targeting the `main` branch.

### 2. **Docker Image Build**

- **File**: `.github/workflows/docker-build.yml`
- **Purpose**: Builds and pushes Docker images to a container registry.
- **Triggers**:
  - On every push to the `main` branch.
  - On manual dispatch.

### 3. **Code Linting**

- **File**: `.github/workflows/lint.yml`
- **Purpose**: Runs linters to ensure code quality and adherence to standards.
- **Triggers**:
  - On every pull request.

### 4. **Deployment**

- **File**: `.github/workflows/deploy.yml`
- **Purpose**: Deploys the application to the production environment.
- **Triggers**:
  - On every push to the `release` branch.

### 5. **Security Scans**

- **File**: `.github/workflows/security-scan.yml`
- **Purpose**: Runs security scans to identify vulnerabilities in dependencies.
- **Triggers**:
  - On a weekly schedule.

---

### How to View or Edit Workflows

All workflows are located in the `.github/workflows/` directory. To edit a workflow, modify the corresponding `.yml` file.
