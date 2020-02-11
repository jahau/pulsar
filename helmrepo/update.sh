#!/bin/sh
set -xe

PKG_VER="0.0.1-$(git rev-parse master)"

(
  git worktree add src master
  trap 'git worktree remove src' EXIT
  helm package --version "${PKG_VER}" src/deployment/kubernetes/helm/pulsar/
  helm repo index .
)

git add "pulsar-${PKG_VER}.tgz" index.yaml
git commit -m "Added package version ${PKG_VER}"

set +x
cat <<EOF

Packaged and committed pulsar version ${PKG_VER}
Inspect the commit with \`git show\` and if happy, \`git push\`

EOF

