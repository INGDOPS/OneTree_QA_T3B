#!/usr/bin/env bash
wait_short(){ sleep 1; }
wait_default(){ sleep "$POS_DEFAULT_WAIT"; }
wait_long(){ sleep "$POS_LONG_WAIT"; }
wait_for_command(){
  local timeout="$1"; shift
  local start=$(date +%s)
  while ! "$@" >/dev/null 2>&1; do
    if (( $(date +%s) - start >= timeout )); then return 1; fi
    sleep 1
  done
  return 0
}
