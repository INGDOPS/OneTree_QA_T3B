#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script

ejecutar_confirmacion_fondeo_inicial(){
  info "Ejecutando confirmacion de fondeo inicial"
  iniciar_video "$POS_VIDEO_DIR/fondeo/fondeo_inicial_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  xdotool mousemove --sync 1837 161 click 1
  sleep 2
  screenshot "Confirmar_fondeo_inicial"
  sleep 2
  press_key Tab
  press_key Tab
  press_key Return
  sleep 1
  detener_video
  sleep 4
}

ejecutar_recuperacion_fondeo_inicial(){
  info "Ejecutando recuperacion de fondeo inicial"
  iniciar_video "$POS_VIDEO_DIR/fondeo/fondeo_inicial_recuperacion_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  xdotool mousemove --sync 1837 161 click 1
  sleep 2
  screenshot "Recuperacion_fondeo_inicial"
  sleep 2
  press_key Tab
  press_key Tab
  press_key Return
  sleep 1
  detener_video
  sleep 4
}

ejecutar_recuperacion_fondeo_adicional(){
  info "Ejecutando recuperacion de fondeo inicial"
  iniciar_video "$POS_VIDEO_DIR/fondeo/fondeo_adicional_recuperacion_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  xdotool mousemove --sync 1837 161 click 1
  sleep 2
  screenshot "Recuperacion_fondeo_adicional"
  sleep 2
  press_key Tab
  press_key Tab
  press_key Return
  sleep 1
  detener_video
  sleep 4
}

