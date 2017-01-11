#! /bin/sh
set -eu

commit_message_file="$1"

exit_code=0

for index in $(seq 6)
do
  "./src/0$index-"* "$commit_message_file" || exit_code=$(( exit_code + $? ))
done

exit "$exit_code"
