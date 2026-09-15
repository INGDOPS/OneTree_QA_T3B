#!/usr/bin/env bash
VIDEO_PID=""
iniciar_video(){
  local nombre="$1"
  mkdir -p "$(dirname "$nombre")"
  if ! command -v ffmpeg >/dev/null 2>&1; then
    warn "ffmpeg no instalado; se omite video"
    return 0
  fi
  ffmpeg -y -video_size "$POS_VIDEO_SIZE" -framerate "$POS_VIDEO_FPS" -f x11grab -i "$POS_DISPLAY" \
    -codec:v libx264 -preset ultrafast -pix_fmt yuv420p "$nombre" >/dev/null 2>&1 &
  VIDEO_PID=$!
  info "Video iniciado: $nombre"
}
detener_video(){
  if [[ -n "${VIDEO_PID:-}" ]] && kill -0 "$VIDEO_PID" 2>/dev/null; then
    kill -INT "$VIDEO_PID" 2>/dev/null || true
    wait "$VIDEO_PID" 2>/dev/null || true
  fi
  VIDEO_PID=""
  info "Video detenido"
}
