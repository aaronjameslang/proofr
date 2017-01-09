#! /bin/sh
set -eu

commit_message_file="$1"

# Pass if message has 1 or fewer lines
test 1 -ge "$(< "$commit_message_file" wc -l)" ||
# Pass if second line is blank
test   -z  "$(< "$commit_message_file" head -n 2 | tail -n 1)"
