#! /bin/sh
set -eu

rule="./rules/03-capital.sh"
msg_dir=$PWD/test/03-capital

it_passes_empty() {
  output="$($rule $msg_dir/empty.msg)"
  test -z "$output"
}

it_passes_blank() {
  output="$($rule $msg_dir/blank.msg)"
  test -z "$output"
}

it_passes_capital() {
  output="$($rule $msg_dir/capital.msg)"
  test -z "$output"
}

it_fails_lower_case() {
  output="$(! $rule $msg_dir/lower-case.msg)"
  test -z "$output"
}
