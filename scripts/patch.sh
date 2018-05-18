#!/usr/bin/env bash
for file in `ls ./patch` ; do
  echo "apply patch: ${file}"
  patch -d ./kubernetes -p1 < ./patch/${file}
done
