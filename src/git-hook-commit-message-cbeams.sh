#! /bin/sh
set -eu

commit_message_file="$1"

exit_code=0

validate() {
  # Pass if message is empty
  test 0 -eq "$(< "$commit_message_file" wc -l)" && return
  case $1 in
    *) "./src/0$index-"* "$commit_message_file" ;;
  esac
}

for index in $(seq 6)
do
  validate "$index" || exit_code=$(( exit_code + $? ))
done

exit "$exit_code"
