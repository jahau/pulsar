This is Netdata's Pulsar Helm repository.

# Use

To use this repo with helm, add the repository:

```
helm repo add netdata-pulsar https://netdata.github.io/pulsar/helmrepo/
helm repo update
```

Install the pulsar chart:

```
helm install pulsar netdata-pulsar/pulsar
```

# Update helm package repo

```
helm package pulsar-repo-root/deployment/kubernetes/helm/pulsar/
helm repo index .
```
