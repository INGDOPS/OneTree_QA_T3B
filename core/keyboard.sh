#!/usr/bin/env bash
require_xdotool(){ command -v xdotool >/dev/null 2>&1 || { error "xdotool no está instalado"; return 1; }; }
press_key(){
  require_xdotool || return 1
  xdotool key --clearmodifiers "$1"
  sleep 1
}
type_text(){
  require_xdotool || return 1
  xdotool type --delay "$POS_KEY_DELAY" --clearmodifiers -- "$1"
  sleep 1
}
activate_bot(){
  info "Colocando el cursor en el BOT. . ."
  sleep 3
  press_key Alt+Tab
  sleep 2
  info "BOT activado"
}
login(){
  local user="$1" pass="$2"
  type_text "$user"
  press_key Tab
  type_text "$pass"
  press_key Return
  sleep 3
}
