#!/usr/bin/env bash
set -e
echo "Building Go server for Linux..."
GOOS=linux go build 
docker build -t vincentmvdm/rabbit-api .
go clean
