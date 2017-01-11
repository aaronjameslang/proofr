#! /bin/sh
set -eu

rule="./src/05-imperative-mood.sh"
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

it_fails_past_tense() {
  output="$(! $rule "$msg_dir/past-tense.msg")"
  test "$output" == 'Use the imperative mood in the subject line'
}
