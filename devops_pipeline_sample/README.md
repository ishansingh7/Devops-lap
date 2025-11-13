# DevOps Pipeline Sample (Git + Jenkins + Terraform + Prometheus)

This repository is a **fully implemented example** of a DevOps pipeline codebase you can use as a starting point.
It includes:
- A sample Node.js application exposing `/` and `/metrics` (Prometheus client)
- `Jenkinsfile` (build, test, terraform, deploy stages)
- `infra/` Terraform files (AWS placeholders - edit variables before use)
- `prometheus/` config and alert rules
- `scripts/` for deployment and systemd service example
- `user_data.sh` example for server bootstrap (cloud-init)

> **Important:** This repo contains sample code and placeholders (e.g., AMI IDs, S3 bucket names, and credentials).
> Replace placeholders with real values before applying Terraform or running deployment.
