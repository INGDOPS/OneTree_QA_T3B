#!/usr/bin/env bash
screenshot(){
  local name="$1"
  mkdir -p "$POS_SCREEN_DIR"
  local file="$POS_SCREEN_DIR/${name}_$(date +%Y%m%d_%H%M%S).png"
  if command -v gnome-screenshot >/dev/null 2>&1; then
    gnome-screenshot -f "$file"
  elif command -v scrot >/dev/null 2>&1; then
    scrot "$file"
  else
    error "No existe gnome-screenshot ni scrot"
    return 1
  fi
  sleep "$POS_SCREENSHOT_DELAY"
  info "Screenshot: $file"
}
