#! /bin/sh
set -eu

have () {
  command -v "$1" >/dev/null 2>&1
}

find_scripts () {
  find . -perm -u=x -type f | grep --invert-match '\.git'
}

! have shellcheck    && have brew && brew install shellcheck
  have shellcheck    && find_scripts | xargs shellcheck

! have checkbashisms && have brew && brew install checkbashisms
if have checkbashisms
then
  find_scripts | xargs checkbashisms || true
fi

have roundup || brew install roundup
roundup test/*-test.sh
