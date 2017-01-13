#! /bin/sh
set -eu

rule="./src/git-hook-commit-message-cbeams.sh"
msg_dir=$PWD/test/messages

it_passes_empty() {
  output="$($rule "$msg_dir/empty.msg")"
  test -z "$output"
}

it_passes_blank() {
  output="$($rule "$msg_dir/blank.msg")"
  test -z "$output"
}

it_passes_perfect() {
  output="$($rule "$msg_dir/perfect.msg")"
  test -z "$output"
}

it_fails_body_only() {
  output="$($rule "$msg_dir/body-only.msg")" || exit_code=$?
  test 2 -eq $exit_code
  test "$output" = 'Separate subject from body with a blank line'
}

it_fails_too_long_subject() {
  output="$($rule "$msg_dir/too-long-subject.msg")" || exit_code=$?
  test 4 -eq $exit_code
  test "$output" = 'Limit the subject line to 50 characters'
}

it_fails_lower_case() {
  output="$($rule "$msg_dir/lower-case.msg")" || exit_code=$?
  test 8 -eq $exit_code
  test "$output" = 'Capitalize the subject line'
}

it_fails_period() {
  output="$($rule "$msg_dir/period.msg")" || exit_code=$?
  test 16 -eq $exit_code
  test "$output" = 'Do not end the subject line with a period'
}

it_fails_paste_tense() {
  output="$($rule "$msg_dir/past-tense.msg")" || exit_code=$?
  test 32 -eq $exit_code
  test "$output" = 'Use the imperative mood in the subject line'
}

it_fails_over_long_body() {
  output="$($rule "$msg_dir/over-long-body.msg")" || exit_code=$?
  test 64 -eq $exit_code
  test "$output" = 'Wrap the body at 72 characters'
}

it_fails_worst() {
  output="$($rule "$msg_dir/worst.msg")" || exit_code=$?
  test 126 -eq $exit_code
  test "$output" = 'Separate subject from body with a blank line
Limit the subject line to 50 characters
Capitalize the subject line
Do not end the subject line with a period
Use the imperative mood in the subject line
Wrap the body at 72 characters'
}
