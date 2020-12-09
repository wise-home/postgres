#!/bin/bash
set -e

echo ""
echo "Building postgres_wisehome:12"
podman pull docker.io/library/postgres:12
podman build . -t docker.io/wisehome/postgres_wisehome:12 -f Containerfile-12

echo ""
echo "Authenticating with Docker Hub and pushing images"
podman login docker.io
podman push docker.io/wisehome/postgres_wisehome:12

echo ""
echo "All done."
