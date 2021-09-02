#!/bin/bash

docker buildx build --platform linux/amd54,linux/arm64 -t kevinyu0506/update-kustomize-image:v1.2 --push .
