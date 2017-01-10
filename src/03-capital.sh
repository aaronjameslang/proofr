#! /bin/sh
set -eu

commit_message_file="$1"

# Pass if message has no lines
test 0 -ge "$(< "$commit_message_file" wc -l)" && exit

# Pass if first character is not lower case
head -n 1 "$commit_message_file" | grep --invert-match --quiet '^[a-z]' && exit

./src/error.sh 3
