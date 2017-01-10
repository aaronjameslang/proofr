#! /bin/sh
set -eu

commit_message_file="$1"

for rule in ./src/0*
do
  "$rule" "$commit_message_file"
done
