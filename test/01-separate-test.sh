#! /bin/sh
set -eu

rule="./rules/01-separate.sh"
msg_dir=$PWD/test/01-separate

it_passes_empty() {
  output="$($rule $msg_dir/empty.msg)"
  test -z "$output"
}

it_passes_blank() {
  output="$($rule $msg_dir/blank.msg)"
  test -z "$output"
}

it_passes_subject_only() {
  output="$($rule $msg_dir/subject-only.msg)"
  test -z "$output"
}

it_passes_separate() {
  output="$($rule $msg_dir/separate.msg)"
  test -z "$output"
}

it_fails_not_separate() {
  output="$(! $rule $msg_dir/not-separate.msg)"
  test -z "$output"
}
