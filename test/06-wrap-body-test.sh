#! /bin/sh
set -eu

rule="./src/06-wrap-body.sh"
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

it_passes_long_body() {
  output="$($rule "$msg_dir/long-body.msg")"
  test -z "$output"
}

it_fails_over_long_body() {
  output="$(! $rule "$msg_dir/over-long-body.msg")"
  test "$output" = 'Wrap the body at 72 characters'
}
