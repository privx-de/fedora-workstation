#!/usr/bin/env bash
set -e

# Find script directory
SCRIPT="$0"
if [ ! -e "$SCRIPT" ]; then
  case "$SCRIPT" in
    (*/*)
      exit 1
      ;;
    (*)
      SCRIPT=$(command -v -- "$SCRIPT") || exit 1
      ;;
  esac
fi
SCRIPT_DIR=$(cd -P -- "$(dirname -- "$SCRIPT")" && pwd -P) || exit 1

# Run ansible
sudo PLAYBOOK_DIR="$SCRIPT_DIR" ansible-playbook -v -i hosts "$@"
