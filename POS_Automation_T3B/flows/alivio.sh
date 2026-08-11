#!/usr/bin/env bash
popup_alivio_fallback(){
  local window_id
  window_id=$(xdotool search --name "Alivio" 2>/dev/null | head -1 || true)
  [[ -n "$window_id" ]]
}

ejecutar_alivio_si_aparece(){
  info "Validando si aparece popup de Alivio..."
  iniciar_video "$POS_VIDEO_DIR/alivio/alivio_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  local detected=1
  popup_alivio_visual "$POS_ALIVIO_TIMEOUT" && detected=0 || true
  if (( detected != 0 )); then
    popup_alivio_fallback && detected=0 || true
  fi
  if (( detected == 0 )); then
    info "Popup de Alivio detectado"
    screenshot "15_popup_alivio_detectado"
    xdotool click 1
    sleep 1
    type_text "realizar alivio"
    press_key Return
    login "$POS_USER_TRAINEE" "$POS_PASS_TRAINEE"
    sleep 10
    screenshot "16_alivio_autorizado"
    press_key Return
  else
    info "No apareció popup de Alivio. Continúa flujo original."
  fi
  sleep 5
  detener_video
  sleep 3
}

ejecutar_alivio_manual(){
  info "Ejecutando Alivio Manual Ctrl+V"
  iniciar_video "$POS_VIDEO_DIR/alivio/alivio_manual_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  press_key ctrl+v
  sleep 3
  screenshot "alivio_manual_ctrl_v"
  login "$POS_USER_TRAINEE" "$POS_PASS_TRAINEE"
  sleep 3
  press_key F1
  sleep 3
  type_text "600.00"
  press_key Tab
  sleep 3
  type_text "600.00"
  screenshot "alivio_manual_monto_confirmado"
  sleep 2
  press_key F1
  sleep 2
  screenshot "alivio_manual_finalizado"
  sleep 2
  detener_video
  sleep 3
}

ejecutar_alivio_automatico(){
  info "Ejecutando Alivio Automatico"
  iniciar_video "$POS_VIDEO_DIR/alivio/alivio_automatico_$(date +%Y%m%d_%H%M%S).mp4"
  screenshot "alivio_automatico"
  press_key F1
  sleep 3
  login "$POS_USER_TRAINEE" "$POS_PASS_TRAINEE"
  sleep 2
  press_key F1
  screenshot "alivio_automatico_monto_confirmado"
  sleep 2
  press_key F1
  sleep 3
  detener_video
  sleep 3
}