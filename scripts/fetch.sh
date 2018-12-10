#!/usr/bin/env bash
if [ ! -d ./kubernetes ]; then
  git clone --depth=1 https://github.com/kubernetes/kubernetes.git
fi

cd kubernetes
git reset --hard HEAD
git fetch origin refs/tags/${KUBERNETES_VERSION}
