#! /bin/sh
set -eu

rule="./src/01-separate.sh"
msg_dir=$PWD/test/messages

it_passes_empty() {
  output="$($rule "$msg_dir/empty.msg")"
  test -z "$output"
}

it_passes_blank() {
  output="$($rule "$msg_dir/blank.msg")"
  test -z "$output"
}

it_passes_subject_only() {
  output="$($rule "$msg_dir/subject-only.msg")"
  test -z "$output"
}

it_passes_perfect() {
  output="$($rule "$msg_dir/perfect.msg")"
  test -z "$output"
}

it_fails_body_only() {
  output="$(! $rule "$msg_dir/body-only.msg")"
  test -z "$output"
}
