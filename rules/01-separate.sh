#! /bin/sh
set -eu

commit_message_file="$1"

test 1 = "$(< $commit_message_file wc --lines)" ||
test -z "$(< $commit_message_file head --lines 2 | tail --lines 1)"
