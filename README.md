# Update Kustomize Image
An utility script for CI/CD pipelines to update image tags in kustomize format 

### Usecase

* Execute the script by passing environment variables to the container runtime
```
$ docker run -e BUILD_PHASE=${BUILD_PHASE} \
            -e REPO_ACCESS_TOKEN=${REPO_ACCESS_TOKEN} \
            -e REPO_URL=${REPO_URL} \
            -e KUSTOMIZE_PATH=${KUSTOMIZE_PATH} \
            -e GITHUB_USER=${USERNAME} \
            -e GITHUB_USER_EMAIL=${GITHUB_USER_EMAIL} \
            -e IMAGE=${IMAGE} \
            -e IMAGE_TAG=${IMAGE_TAG} \
            kevinyu0506/update-kustomize-image:v1.5
```
