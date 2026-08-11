#!/usr/bin/env bash
command_exists(){ command -v "$1" >/dev/null 2>&1; }
validate_dependencies(){
  local missing=0
  for cmd in xdotool; do
    if ! command_exists "$cmd"; then error "Falta dependencia: $cmd"; missing=1; fi
  done
  for cmd in gnome-screenshot scrot ffmpeg zenity; do
    if ! command_exists "$cmd"; then warn "Dependencia opcional no disponible: $cmd"; fi
  done
  return "$missing"
}
require_credentials(){
  local missing=0
  for v in POS_USER_AV POS_PASS_AV POS_USER_TRAINEE POS_PASS_TRAINEE; do
    if [[ -z "${!v:-}" ]]; then error "Variable requerida no definida: $v"; missing=1; fi
  done
  return "$missing"
}
