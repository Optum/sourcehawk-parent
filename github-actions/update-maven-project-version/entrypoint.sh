#!/bin/bash

RELEASE_BUILD=${1:-false}

# Evaluate the version from the pom.xml file
BUILD_VERSION=$(./mvnw help:evaluate -D expression=project.version -q -D forceStdout | tail -1 | tr -d '\r\n')

# Release Build Scenario
if [[ "$RELEASE_BUILD" == "true" ]]
then

  # Remove "-SNAPSHOT" if necessary
  if [[ "$BUILD_VERSION" == *"-SNAPSHOT" ]]
  then
    RELEASE_VERSION="${BUILD_VERSION%"-SNAPSHOT"}"
    ./mvnw --batch-mode versions:set -D removeSnapshot || true
  fi

  # If release tag already exists, exit early
  if [[ "$(git tag -l "$RELEASE_VERSION")" == "$RELEASE_VERSION" ]]
  then
    echo "Tag $RELEASE_VERSION already exists" && exit 1
    echo ::set-output name=PROJECT_VERSION::"$RELEASE_VERSION"
  fi

# Snapshot Build Scenario
else

  # Add "-SNAPSHOT" if necessary
  if [[ "$BUILD_VERSION" != *"-SNAPSHOT" ]]
  then
    BUILD_VERSION="${BUILD_VERSION}-SNAPSHOT"
    ./mvnw --batch-mode versions:set -D newVersion="$BUILD_VERSION" || true
    echo ::set-output name=PROJECT_VERSION::"$BUILD_VERSION"
  fi

fi