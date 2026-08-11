#!/usr/bin/env bash
ejecutar_cierre_turno(){
  info "Ejecutando Paso 9: Cierre de turno"
  sleep 2
  iniciar_video "$POS_VIDEO_DIR/cierre/cierre_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 3
  press_key ctrl+F11
  screenshot "21_cierre_turno"
  sleep 3
  login "$POS_USER_TRAINEE" "$POS_PASS_TRAINEE"
  sleep 2
  press_key F1
  sleep 2
  type_text "600.00"
  sleep 1
  press_key Tab
  sleep 2
  type_text "600.00"
  screenshot "22_login_cierre_turno"
  sleep 2
  press_key F1
  detener_video
  info "=================================================="
  info "Flujo automatizado de POS 2.0 finalizado"
  info "Evidencias guardadas en: $POS_SCREEN_DIR"
  info "=================================================="
}
