#!/bin/bash

set -e # exit with non-zero exit code if anything fails

update_image_tag() {
    image=$1
    tag=$2
    kustomization_path=$3
    sed -i "/${image//\//\\/}/,/name/s/newTag: .*/newTag: \"$tag\"/" "$kustomization_path"
}

echo "Starting deployment action..."

REMOTE_REPO=$(echo $REPO_URL | sed "s/https:\/\//https:\/\/$REPO_ACCESS_TOKEN@/g")

git clone $REMOTE_REPO k8s-manifests
cd k8s-manifests

if [ ! -z "$IMAGE" ] && [ ! -z "$IMAGE_TAG" ]; then
    echo "Updating $BUILD_PHASE image $IMAGE to $IMAGE:$IMAGE_TAG..."
    update_image_tag $IMAGE $IMAGE_TAG "$KUSTOMIZE_PATH/kustomization.yaml"
else
    echo "Missing specify image to update"
fi

git config user.name "$GITHUB_USER"
git config user.email "$GITHUB_USER_EMAIL"

git add .
git commit -m "[Cloud Build][$BUILD_PHASE] Updating $IMAGE to $IMAGE:$IMAGE_TAG"

git push origin master

rm -rf k8s-manifests
echo "New $BUILD_PHASE version deployed!"
