#! /bin/sh
set -eu

rule="./src/git-hook-commit-message-cbeams.sh"
msg_dir=$PWD/test/messages

it_passes_empty() {
  output="$($rule $msg_dir/empty.msg)"
  test -z "$output"
}

it_passes_blank() {
  output="$($rule $msg_dir/blank.msg)"
  test -z "$output"
}

it_passes_perfect() {
  output="$($rule $msg_dir/perfect.msg)"
  test -z "$output"
}

it_fails_body_only() {
  output="$($rule $msg_dir/body-only.msg)" || exit_code=$?
  test 2 -eq $exit_code
  test "$output" == 'Separate subject from body with a blank line'
}

it_fails_lower_case() {
  output="$($rule $msg_dir/lower-case.msg)" || exit_code=$?
  test 8 -eq $exit_code
  test "$output" == 'Capitalize the subject line'
}

it_fails_worst() {
  output="$($rule $msg_dir/worst.msg)" || exit_code=$?
  test 2 -eq $exit_code
  test "$output" == 'Separate subject from body with a blank line'
}
