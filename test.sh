#! /bin/sh
set -eu

shell="${1:-}"

if test -n "$shell"
then
  echo "Testing using $shell"
else
  echo 'Testing using default shell'
fi

number_of_failures=0

test_message() {
  message=$1
  expected_exit_code=${2:-0}
  expected_output=${3:-}

  printf 'Testing %s ... ' "$message"

  colour_red=$(tput setaf 1)
  colour_green=$(tput setaf 2)
  colour_reset=$(tput sgr0)

  actual_exit_code=0
  actual_output="$($shell ./bin/proofr "./test-messages/$message.msg")" || actual_exit_code=$?
  if test "$expected_output" != "$actual_output"
  then
    echo "${colour_red}failed${colour_reset}"
    echo "expected output $actual_output to be $expected_output"
    number_of_failures=$((number_of_failures + 1))
  elif test "$expected_exit_code" -ne "$actual_exit_code"
  then
    echo "${colour_red}failed${colour_reset}"
    echo "expected exit code $actual_exit_code to be $expected_exit_code"
    number_of_failures=$((number_of_failures + 1))
  else
    echo "${colour_green}passed${colour_reset}"
  fi
}

test_message empty
test_message blank
test_message perfect
test_message long-subject
test_message long-body
test_message subject-only
test_message merge-cli
test_message merge-github
test_message comment-lines
test_message body-only 2 'Separate subject from body with a blank line'
test_message longer-subject 4 'Limit the subject line to 50 characters'
test_message lower-case 8 'Capitalize the subject line'
test_message period 16 'Do not end the subject line with a period'
test_message period-ws 16 'Do not end the subject line with a period'
test_message past-tense 32 'Use the imperative mood in the subject line'
test_message longer-body 64 'Wrap the body at 72 characters'
test_message worst 126 'Separate subject from body with a blank line
Limit the subject line to 50 characters
Capitalize the subject line
Do not end the subject line with a period
Use the imperative mood in the subject line
Wrap the body at 72 characters'

exit "$number_of_failures"
