#! /bin/sh
set -eu

for shell in sh bash dash zsh # csh fish ksh tcsh
do
  if ! shell_path="$(command -v $shell)"
  then
    echo "Skipping $shell"
  else
    ./test.sh "$shell_path"
  fi
done
