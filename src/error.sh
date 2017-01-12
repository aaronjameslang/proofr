#! /bin/sh
set -eu

case $1 in
  1) echo Separate subject from body with a blank line ;;
  2) echo Limit the subject line to 50 characters ;;
  3) echo Capitalize the subject line ;;
  4) echo Do not end the subject line with a period ;;
  5) echo Use the imperative mood in the subject line ;;
  6) echo Wrap the body at 72 characters ;;
  7) echo Use the body to explain _what_ and _why_ vs. _how_ ;;
esac

exit $((1<<$1))
