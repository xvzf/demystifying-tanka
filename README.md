# Demystifying Tanka

## What is Jsonnet?
> Install using `brew install jsonnet`

Examples at `./what-is-jsonnet/` (copy of the [official examples](https://jsonnet.org))

## Dependency Management
> Install using `brew install jsonnet-bundler`

jsonnet-bundler (executed by running `jb`) is a Jsonnet package manager like composer/npm.

`jb install 'ssh://git@github.com/jsonnet-libs/k8s-libsonnet.git/1.25@main'`


## Jsonnet and Kubernetes

### YAML, Kustomize and Jsonnet

### Tanka aka "Jsonnet for Kubernetes"
> Install using `brew install tanka`

Tanka is a utility which wraps around jsonnet and jsonnet-bundler and helps to manage Kubernetes templates.

### Comparison to helm
