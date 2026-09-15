#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script

ejecutar_alivio_tombola(){
  info "Ejecutando confirmacion de alivio a tombola"
  iniciar_video "$POS_VIDEO_DIR/alivio/alivio_tombola_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  xdotool mousemove --sync 1837 161 click 1
  sleep 2
  screenshot "Alivio_tombola"
  sleep 2
  press_key Tab
  press_key Tab
  press_key Return
  sleep 1
  detener_video
  sleep 4
}

ejecutar_alivio(){
  info "Ejecutando confirmacion alivio manual"
  iniciar_video "$POS_VIDEO_DIR/alivio/alivio_manual_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  xdotool mousemove --sync 1837 161 click 1
  sleep 2
  screenshot "Alivio_disponible"
  sleep 2
  press_key Tab
  press_key Tab
  press_key Return
  sleep 1
  detener_video
  sleep 4
}