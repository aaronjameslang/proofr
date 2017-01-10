#! /bin/sh
set -eu

rule="./src/03-capital.sh"
msg_dir=$PWD/test/messages
error_message='Capitalize the subject line'

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

it_fails_lower_case() {
  output="$(! $rule "$msg_dir/lower-case.msg")"
  test "$error_message" == "$output"
}
