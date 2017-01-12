#! /bin/sh
set -eu

rule="./src/02-limit-subject.sh"
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

it_passes_long_subject() {
  output="$($rule "$msg_dir/long-subject.msg")"
  test -z "$output"
}

it_fails_too_long_subject() {
  output="$(! $rule "$msg_dir/too-long-subject.msg")"
  test "$output" = 'Limit the subject line to 50 characters'
}
