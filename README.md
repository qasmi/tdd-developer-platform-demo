## Test-Driven Development Applied to Developer Platforms

This repository provides a complete, self-contained demonstration environment.

The project uses a local **Kind (Kubernetes in Docker) cluster** to deploy the required infrastructure, including **ArgoCD** for managing the deployment pipeline.

### What This Repository Does

This repository sets up a complete GitOps workflow:

1.  **Demo Environment Setup:** Deploys a local Kind cluster with ArgoCD installed.
2.  **GitOps Bootstrap:** Configures ArgoCD to bootstrap and manage a specified GitOps repository (this repository). The GitOps repo include **crossplane**.

# Getting Started

To install the environment and reproduce the validation demo, please follow the detailed instructions below.

## 1\. Infrastructure Setup

Run the following script to install the required tools (like `kubectl`, `kind`, etc.) in your environment (if needed):

```bash
playgrounds/tooling.sh
```

## 2\. Kubernetes Cluster + ArgoCD + GitOps Bootstrap

The lab runs with [Devbox](https://www.jetify.com/devbox) to manage dependencies:

  * Set up the cluster and bootstrap GitOps:

```bash
cd playgrounds/kind
devbox run setup
```

This command sets up the Kubernetes cluster, installs ArgoCD, and bootstraps the initial GitOps applications (`crossplane`).

## Clean up

  * Tear down and clean up all resources:

```bash
cd playgrounds/kind
devbox run shutdown
```

```bash
kubectl apply -f ../../demo-cluster/apps/projects.yaml
kubectl apply -f ../../demo-cluster/apps/bootstrap.yaml
```