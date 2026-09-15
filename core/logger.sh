#!/usr/bin/env bash
log(){
  local level="$1"; shift
  local msg="$*"
  local line="$(date '+%Y-%m-%d %H:%M:%S') [$level] $msg"
  echo "$line"
  mkdir -p "$POS_LOG_DIR"
  echo "$line" >> "$POS_LOG_DIR/pos_$(date '+%Y%m%d').log"
}
info(){ log INFO "$@"; }
warn(){ log WARN "$@"; }
error(){ log ERROR "$@" >&2; }
