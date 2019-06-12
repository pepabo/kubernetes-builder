#!/usr/bin/env bash
version=$1
for file in `ls ./patch/${version}` ; do
  echo "apply patch: ${file}"
  patch -d ./kubernetes -p1 < ./patch/${version}/${file}
done
