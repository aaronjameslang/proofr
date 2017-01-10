#! /bin/sh
set -eu

commit_message_file="$1"

# Pass if first line is less than or equal to 51 characters (50 + newline)
test 51 -ge "$(< "$commit_message_file" head -n 1 | wc --chars)" && exit
