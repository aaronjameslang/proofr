#! /bin/sh
set -eu

commit_message_file="$1"

rule() {
  case $1 in
    1) echo Separate subject from body with a blank line ;;
    2) echo Limit the subject line to 50 characters ;;
    3) echo Capitalize the subject line ;;
    4) echo Do not end the subject line with a period ;;
    5) echo Use the imperative mood in the subject line ;;
    6) echo Wrap the body at 72 characters ;;
    7) echo Use the body to explain _what_ and _why_ vs. _how_ ;;
  esac
}

validate() {
  # Pass if message is empty
  test 0 -eq "$(< "$commit_message_file" wc -l)" && return
  case $1 in
    1) # Message has one line, or second line is blank
      test  1 -eq "$(< "$commit_message_file" wc -l)" ||
      test    -z  "$(< "$commit_message_file" head -n 2 | tail -n 1)" ;;
    2) # Subject is no more than 51 characters (50 + newline)
      test 51 -ge "$(< "$commit_message_file" head -n 1 | wc -m)" ;;
    3) # Subject does not begin with lowercase letter
      head -n 1 "$commit_message_file" | grep --invert-match --quiet '^[a-z]' ;;
    4) # Subject does not end with a period
      head -n 1 "$commit_message_file" | grep --invert-match --quiet '\.$' ;;
    5) # Subject does not begin with past tense
      head -n 1 "$commit_message_file" | grep --invert-match --quiet '^\w*ed\s' ;;
    6) # Body does not contain line longer than 73 characters
      ./src/06-wrap-body.sh "$commit_message_file"
  esac
}

calc_error_code() {
  echo $((1<<$1))
}

exit_code=0

for index in $(seq 6)
do
  validate "$index" && continue
  rule "$index"
  error_code=$(calc_error_code "$index")
  exit_code=$(( exit_code + error_code ))
done

exit "$exit_code"
