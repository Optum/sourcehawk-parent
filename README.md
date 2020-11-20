sourcehawk-parent
-----------------

[![Maven Central](https://img.shields.io/maven-central/v/com.optum.sourcehawk/sourcehawk-parent.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22com.optum.sourcehawk%22%20AND%20a:%22sourcehawk-parent%22) 
[![Build Status](https://github.com/optum/sourcehawk-parent/workflows/Maven%20CI/badge.svg)](https://github.com/optum/sourcehawk-parent/actions) 
[![Sourcehawk Scan](https://github.com/optum/sourcehawk-parent/workflows/Sourcehawk%20Scan/badge.svg)](https://github.com/optum/sourcehawk-parent/actions) 

![OSS Lifecycle](https://img.shields.io/osslifecycle/optum/sourcehawk-parent)
[![Sonatype OSS Index](https://img.shields.io/badge/Sonatype%20OSS%20Index-sourcehawk--parent-informational)](https://ossindex.sonatype.org/component/pkg:maven/com.optum.sourcehawk/sourcehawk-parent)

Sourcehawk Parent Pom for supporting maven project inheritance

## Overview

### parent
Manages commonly used plugins and configurations across all types of packaging and builds.

#### Usage
```xml
<parent>
    <groupId>com.optum.sourcehawk</groupId>
    <artifactId>sourcehawk-parent</artifactId>
    <version>1.1.8</version>
</parent>
```

### checkstyle-config
Houses the checkstyle configurations for all projects.

### jar-parent
Manages plugins and profiles for all JAR based projects which extend it.

#### Usage
```xml
<parent>
    <groupId>com.optum.sourcehawk</groupId>
    <artifactId>sourcehawk-jar-parent</artifactId>
    <version>1.1.8</version>
</parent>
```

## Development

### Building

```sh
./mvnw clean install
```

#### Dev Profiles
Any project which inherits from this parent pom, will be able to use these as well.

##### dev.test
Skip Enforcer

```sh
./mvnw clean install -P dev.test
```

##### dev.min
Skip Enforcer, Static Code Analysis and Tests

```sh
./mvnw clean install -P dev.min
```
