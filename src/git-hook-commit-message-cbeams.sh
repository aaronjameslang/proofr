#! /bin/sh
set -eu

commit_message_file="$1"

exit_code=0

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

for index in $(seq 6)
do
  validate "$index" && continue
  ./src/error.sh "$index" || exit_code=$(( exit_code + $? ))
done

exit "$exit_code"
