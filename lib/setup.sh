#! /bin/sh --version
set -eu

setup() {
  file='.git/hooks/commit-msg'
  if ( test -f "$file" && grep_for_proofr "$file" )
  then
    echo 'proofr already setup'
  else
    echo "$0" '"$@" || exit $?' >> "$file"
    chmod u+x "$file"
  fi
}

grep_for_proofr () {
  grep --quiet '\bproofr\b' "$@"
}
