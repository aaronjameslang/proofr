#! /bin/sh
set -eu

commit_message_file="$1"

# Fail if any line is greater than 73 characters (72 + newline)
while read -r line
do
  test 73 -ge "${#line}"
done < "$commit_message_file"
