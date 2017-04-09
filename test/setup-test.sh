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
  cd "$(mktemp -d proofr-test-XXXX)"
  git init
  file=".git/hooks/commit-msg"
  echo banana > "$file"
  ../../bin/proofr setup
  actual="$(cat "$file")"
  expected='banana
../../bin/proofr "$@" || exit $?'
  rm -rf "$PWD"
  cd -
  test "$expected" = "$actual"
}

it_sets_up_missing_hook () {
  cd "$(mktemp -d proofr-test-XXXX)"
  git init
  file=".git/hooks/commit-msg"
  rm -f "$file"
  test -d "$(dirname "$file")"
  ! test -f "$file"
  ../../bin/proofr setup
  test -x "$file"
  actual="$(cat "$file")"
  expected='../../bin/proofr "$@" || exit $?'
  rm -rf "$PWD"
  cd -
  test "$expected" = "$actual"
}

it_sets_up_exisiting_hook () {
  cd "$(mktemp -d proofr-test-XXXX)"
  git init
  file=".git/hooks/commit-msg"
  echo banana proofr > "$file"
  ../../bin/proofr setup
  actual="$(cat "$file")"
  expected='banana proofr'
  rm -rf "$PWD"
  cd -
  test "$expected" = "$actual"
}

it_sets_up_hook_and_hook_works () {
  cd "$(mktemp -d proofr-test-XXXX)"
  git init
  PATH="$PWD/../../bin/:$PATH"
  rm -f .git/hooks/commit-msg
  proofr setup
  test -x .git/hooks/commit-msg
  actual="$(git commit --allow-empty --message 'Fix it')"
  echo "$actual" | grep --quiet '\[master (root-commit) [0-9a-f]\{7\}\] Fix it'
  actual="$(! git commit --allow-empty --message 'fixed it.' 2>&1)"
  test 'Capitalize the subject line
Do not end the subject line with a period
Use the imperative mood in the subject line' = "$actual"
  rm -rf "$PWD"
  cd -
}

if echo "$0" | grep --quiet -v 'roundup'
then
  it_matches_hook
  it_sets_up_hook
  it_matches_other_hook
  it_sets_up_missing_hook
  it_sets_up_exisiting_hook
  it_does_not_match_no_hook
  it_sets_up_hook_and_hook_works
fi
