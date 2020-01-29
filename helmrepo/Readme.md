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
git worktree add src master

helm package src/deployment/kubernetes/helm/pulsar/
helm repo index .

git worktree remove src
```

replace `master` with the commit-ish revision you want to build helm
package for.
