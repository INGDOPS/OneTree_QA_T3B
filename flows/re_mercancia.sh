#!/usr/bin/env bash
popup_alivio_fallback(){
  local window_id
  window_id=$(xdotool search --name "Alivio" 2>/dev/null | head -1 || true)
  [[ -n "$window_id" ]]
}

ejecutar_recibir_mercancia(){
  info "Ejecutando Recibir Mercancia  Ctrl+R"
  iniciar_video "$POS_VIDEO_DIR/alivio/alivio_manual_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  press_key ctrl+r
  sleep 2
  screenshot "Recibir_mercancia_ctrl_v"
  sleep 2                   
  xdotool mousemove --sync 926 526 click 1
  sleep 2
  xdotool mousemove --sync 1139 622 click 1
  sleep 2
  screenshot "recibir_mercancia_monto_confirmado"
  sleep 2
  xdotool mousemove --sync 1667 949 click 1
  sleep 2
  screenshot "recibir_mercancia_finalizado"
  sleep 3
  detener_video
  sleep 3
}
