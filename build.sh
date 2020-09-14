#!/bin/bash
# This script builds the wisehome/postgres_wisehome container image using podman in both versions

set -e

echo ""
echo "Building postgres_wisehome:9.6"
podman pull --tls-verify=true docker.io/library/postgres:9.6
podman build . -t docker.io/wisehome/postgres_wisehome:9.6 -f Containerfile-9.6

echo ""
echo "Building postgres_wisehome:12"
podman pull --tls-verify=true docker.io/library/postgres:12
podman build . -t docker.io/wisehome/postgres_wisehome:12 -f Containerfile-12

echo ""
echo "Authenticating with Docker Hub and pushing images"
podman login --tls-verify=true docker.io
podman push --tls-verify=true docker.io/wisehome/postgres_wisehome:9.6
podman push --tls-verify=true docker.io/wisehome/postgres_wisehome:12

echo ""
echo "All done."
