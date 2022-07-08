## Introduction

This document describes how to deploy a cloud-native application on Openshift Container Platform, expose its endpoints to simulate user(s) querying nearest vacation/ workation or staycation properties.

## Prerequisites

- Should have OCP 4.10 or equivalent Kubernetes 
- The images are staged here quay.io/krvoora/airbnb:latest

## Configuration

#### Instructions to deploy the application ####
Create a New Project

```
    export NAMESPACE=perfscale
    oc new-project $NAMESPACE
```

Git clone project

```
    git clone https://github.com/krishvoor/airbnb
    cd airbnb/deployment
```

Deploy the app

```
    oc create -f service.yaml
    oc create -f deployment.yaml
```

Expose the app

```
    oc create -f route.yaml
```