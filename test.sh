#! /bin/sh
set -eu

have () {
  command -v "$1" >/dev/null 2>&1
}

! have shellcheck && have brew && brew install shellcheck
have shellcheck && find . -perm -u=x -type f | grep --invert-match '\.git' | xargs shellcheck

! have checkbashisms && have brew && brew install checkbashisms
have checkbashisms && find . -perm -u=x -type f | grep --invert-match '\.git' | xargs checkbashisms | true
have roundup || brew install roundup
roundup test/*-test.sh
