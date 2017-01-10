#! /bin/sh
set -eu

commit_message_file="$1"

exit_code=0

for rule in ./src/0*
do
  "$rule" "$commit_message_file" || exit_code=$(echo $exit_code + $? | bc)
done

exit "$exit_code"
