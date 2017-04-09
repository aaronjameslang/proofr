#! /bin/sh --version
set -eu

# shellcheck source=lib/setup.sh
. ../lib/setup.sh

it_does_not_match_no_hook () {
  input='some-other-command --abc proofrun'
  actual="$(! echo "$input" | grep_for_proofr)"
  test -z "$actual"
}

it_matches_hook () {
  input='proofr "$@" || exit $?'
  actual="$(echo "$input" | grep_for_proofr)"
  test -z "$actual"
}

it_matches_other_hook () {
  # shellcheck disable=SC2016
  input='command proofr "$1"'
  actual="$(echo "$input" | grep_for_proofr)"
  test -z "$actual"
}

it_sets_up_hook () {
  export GIT_DIR
  GIT_DIR="$(mktemp -d proofr-test-XXXX)"
  file="$GIT_DIR/hooks/commit-msg"
  mkdir "$(dirname "$file")"
  echo banana > "$file"
  ../bin/proofr setup
  actual="$(cat "$file")"
  expected='banana
../bin/proofr "$@" || exit $?'
  rm -rf "$GIT_DIR"
  test "$expected" = "$actual"
}

it_sets_up_missing_hook () {
  export GIT_DIR
  GIT_DIR="$(mktemp -d proofr-test-XXXX)"
  file="$GIT_DIR/hooks/commit-msg"
  mkdir "$(dirname "$file")"
  echo banana > "$file"
  ../bin/proofr setup
  actual="$(cat "$file")"
  expected='banana
../bin/proofr "$@" || exit $?'
  rm -rf "$GIT_DIR"
  test "$expected" = "$actual"
}


it_sets_up_exisiting_hook () {
  export GIT_DIR
  GIT_DIR="$(mktemp -d proofr-test-XXXX)"
  file="$GIT_DIR/hooks/commit-msg"
  mkdir "$(dirname "$file")"
  echo banana proofr > "$file"
  ../bin/proofr setup
  actual="$(cat "$file")"
  expected='banana proofr'
  rm -rf "$GIT_DIR"
  test "$expected" = "$actual"
}

if echo "$0" | grep --quiet -v 'roundup'
then
  it_matches_hook
  it_sets_up_hook
  it_matches_other_hook
  it_sets_up_missing_hook
  it_sets_up_exisiting_hook
  it_does_not_match_no_hook
fi
