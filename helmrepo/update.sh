#!/bin/sh
set -xe

GIT_REV=${1:-master}
PKG_VER="0.0.1-$(git rev-parse "${GIT_REV}")"

(
  git worktree add src "${GIT_REV}"
  trap 'git worktree remove src' EXIT
  helm package --version "${PKG_VER}" src/deployment/kubernetes/helm/pulsar/
  helm repo index .
)

git add "pulsar-${PKG_VER}.tgz" index.yaml
git commit -m "Added package version ${PKG_VER}"

set +x
cat <<EOF

Packaged and committed version ${PKG_VER} from ${GIT_REV}
Inspect the commit with \`git show\` and if happy, \`git push\`

EOF
