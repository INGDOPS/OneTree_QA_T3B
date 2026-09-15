#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script

#!/usr/bin/env bash
popup_alivio_fallback(){
  local window_id
  window_id=$(xdotool search --name "Alivio" 2>/dev/null | head -1 || true)
  [[ -n "$window_id" ]]
}

ejecutar_merma(){
  info "Ejecutando Realizar Merma"
  iniciar_video "$POS_VIDEO_DIR/merma/realizar_merma_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  xdotool mousemove --sync 49 238 click 1
  sleep 2
  screenshot "Realizar_merma"
  sleep 2                   
  xdotool mousemove --sync 131 231 click 1
  sleep 2
  xdotool mousemove --sync 129 267 click 1
  sleep 2
  screenshot "Mercancia_merma"
  sleep 2
  xdotool mousemove --sync 1769 890 click 1
  sleep 2
  screenshot "recibir_mercancia_finalizado"
  sleep 2
  login "$BOT_USER_GT" "$BOT_PASS_GT"
  sleep 2
  screenshot "Registra_merma"
  sleep 2
  press_key 3
  press_key Tab
  sleep 1
  xdotool mousemove --sync 1430 258 click 1
  sleep 1
  press_key Return 
  sleep 1
  press_key Tab 
  sleep 1
  press_key 3
  press_key Tab
  sleep 1
  xdotool mousemove --sync 1367 303 click 1
  sleep 1
  press_key Down
  press_key Down
  press_key Down
  press_key Down
  press_key Return
  sleep 2
  screenshot "merma_registrada"
  sleep 1
  xdotool mousemove --sync 1698 919 click 1
  screenshot "merma_registrada_finalizada"
  detener_video
  sleep 3
}
