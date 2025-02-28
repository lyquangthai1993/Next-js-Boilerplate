#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Lấy version từ argument, nếu không có sẽ dùng 'latest'
VERSION=${1:-latest}

# Tạo tên image với version
IMAGE_NAME="local/strapi-nextjs/nextjs:${VERSION}"

# Xóa image cũ
podman rmi ${IMAGE_NAME} || true

# Build image với version
podman build --tls-verify=false -t ${IMAGE_NAME} -f ./Dockerfile ./