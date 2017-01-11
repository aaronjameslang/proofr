#! /bin/sh
set -eu

commit_message_file="$1"

# Pass if message has no lines
test 0 -ge "$(< "$commit_message_file" wc -l)" && exit

# Pass if first line does not end with a period
< "$commit_message_file" head -n 1 | grep --invert-match --quiet '\.$' && exit

./src/error.sh 4
