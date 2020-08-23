# Radon

RadonDB is an open source, Cloud-native MySQL database for unlimited scalability and performance.

RadonDB = Radon + Mysql

## Introduction

This chart bootstraps a single node Radon statefulset on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.10+ with Beta APIs enabled
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ cd radon
$ helm install --name my-release .
```

> set radon parameters in value.yaml
>
> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` :

```bash
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release completely.

## Persistence

By default a PersistentVolumeClaim is created and mounted into that directory. In order to disable this functionality
you can change the values.yaml to disable persistence and use an emptyDir instead.

> *"An emptyDir volume is first created when a Pod is assigned to a Node, and exists as long as that Pod is running on that node. When a Pod is removed from a node for any reason, the data in the emptyDir is deleted forever."*


## change parameters

 use this api (https://github.com/radondb/radon/blob/master/docs/api.md)
