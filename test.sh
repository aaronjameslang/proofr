#! /bin/sh
set -eu

have () {
  command -v "$1" >/dev/null 2>&1
}

find_scripts () {
  find . -perm -u=x -type f | grep --invert-match '\.git'
}

if ! have shellcheck && have brew
then
 brew install shellcheck
fi

if have shellcheck
then
  find_scripts | xargs shellcheck
else
  echo Skipping shellcheck, command not found
fi

if ! have checkbashisms && have brew
then
 brew install checkbashisms
fi

if have checkbashisms
then
  find_scripts | xargs checkbashisms || true
else
  echo Skipping checkbashisms, command not found
fi

if ! have roundup && have brew
then
 brew install roundup
fi

if have roundup
then
  roundup test/*-test.sh
else
  echo Failing roundup, command not found
  exit 1
fi
