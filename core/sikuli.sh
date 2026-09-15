#!/usr/bin/env bash
sikuli_available(){ command -v runsikulix >/dev/null 2>&1 || command -v sikulix >/dev/null 2>&1; }
sikuli_run(){
  local script="$1"
  if command -v runsikulix >/dev/null 2>&1; then
    runsikulix -r "$script"
  elif command -v sikulix >/dev/null 2>&1; then
    sikulix -r "$script"
  else
    warn "SikuliX no está instalado; se utilizará fallback xdotool"
    return 2
  fi
}
popup_alivio_visual(){
  local timeout="${1:-3}"
  if ! sikuli_available; then return 2; fi
  timeout "$((timeout+2))" bash -c "sikuli_run '$POS_SIKULI_DIR/detect_alivio.sikuli'" >/dev/null 2>&1
}
