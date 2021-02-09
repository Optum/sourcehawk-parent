#!/bin/sh

GIT_USERNAME="${1:-$GITHUB_ACTOR}"
GIT_EMAIL="$2"
TAG_PREFIX="${3:-v}"
TAG_VERSION="$4"

git config user.name "$GIT_USERNAME"
git config user.email "$GIT_EMAIL"
git tag -a "$TAG_PREFIX$TAG_VERSION" -m "Created by @$GITHUB_ACTOR"
git push origin --tags