#! /bin/sh
set -eu

for dependency in \
  checkbashisms \
  roundup \
  shellcheck \
;do
  command -v $dependency >/dev/null 2>&1 || brew install $dependency
done
