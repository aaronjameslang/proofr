#! /bin/sh
set -eu

rule="./src/04-no-period.sh"
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

it_fails_period() {
  output="$(! $rule "$msg_dir/period.msg")"
  test "$output" == 'Do not end the subject line with a period'
}
