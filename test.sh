#! /bin/sh
set -eu

have () {
  command -v "$1" >/dev/null 2>&1
}

have roundup || brew install roundup
roundup test/*-test.sh
