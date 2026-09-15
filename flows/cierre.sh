#!/usr/bin/env bash
ejecutar_cierre_dia(){
  info "Ejecutando ultimo paso: Cierre de día"
  sleep 2
  iniciar_video "$POS_VIDEO_DIR/cierre/cierre_dia_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  press_key ctrl+alt+a
  screenshot "cierre_dia"
  sleep 2
  press_key Tab
  press_key Tab
  press_key Return
  sleep 2
  screenshot "log_cierre_dia"
  sleep 2
  press_key F1
  detener_video
  info "=================================================="
  info "Flujo automatizado de BOT 2.0 finalizado"
  info "Evidencias guardadas en: $POS_SCREEN_DIR"
  info "=================================================="
}

ejecutar_cierre_turno_pos(){
  info "Ejecutando confirmacion de cierre de turno POS"
  iniciar_video "$POS_VIDEO_DIR/cierre/cierre_turno_pos_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  xdotool mousemove --sync 1836 203 click 1
  sleep 2
  screenshot "Alivio_tombola_final"
  sleep 2
  press_key Tab
  press_key Tab
  press_key Return
  sleep 1
  xdotool mousemove --sync 1840 160 click 1
  sleep 2
  screenshot "Confirmacion_cierre_turno_pos"
  sleep 2
  press_key Tab
  press_key Tab
  press_key Return
  sleep 1
  screenshot "Cierre_pos_finalizado"
  sleep 1
  detener_video
  sleep 4
}