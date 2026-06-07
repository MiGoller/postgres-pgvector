# PostgreSQL Alpine with pgvector

A lightweight, production-ready PostgreSQL Docker image based on Alpine Linux, featuring the compiled and pre-installed `pgvector` extension. 

Official Alpine-based images with `pgvector` are often hard to find or outdated. This repository solves that by providing an automated, continuously updated build.

## Features

* **Lightweight:** Based on the official `postgres:17-alpine` to keep the image footprint as small as possible.
* **Up-to-Date:** Automatically rebuilt every Sunday morning to catch the latest PostgreSQL upstream updates and Alpine security patches.
* **Security First:** Every build is automatically scanned for vulnerabilities using **Trivy**. Scan results are uploaded directly to the GitHub Security tab.
* **Long-Term Automation:** Powered by GitHub Actions with an integrated keep-alive workflow to ensure the automated cron jobs never sleep.

## Usage

You can use this image in your `docker-compose.yml` just like the official PostgreSQL image:

```yaml
services:
  db:
    image: ghcr.io/migoller/postgres-pgvector:17-alpine
    environment:
      POSTGRES_DB: my_vector_db
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: my_secret_password
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
