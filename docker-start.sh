#!/usr/bin/env bash

# shellcheck disable=SC2154
chinilla start "${service}"

trap "echo Shutting down ...; chinilla stop all -d; exit 0" SIGINT SIGTERM

# shellcheck disable=SC2154
if [[ ${log_to_file} == 'true' ]]; then
  # Ensures the log file actually exists, so we can tail successfully
  touch "$CHINILLA_ROOT/log/debug.log"
  tail -F "$CHINILLA_ROOT/log/debug.log" &
fi

while true; do sleep 1; done
