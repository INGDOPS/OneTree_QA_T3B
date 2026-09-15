#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script

ejecutar_kardex(){
  info "Ejecutando visualizar kardex"
  iniciar_video "$POS_VIDEO_DIR/kardex/kardex_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 3
  xdotool mousemove --sync 47 244 click 1
  sleep 1  
  xdotool mousemove --sync 268 136 click 2   
  sleep 1
  type_text "pure"
  sleep 1
  xdotool mousemove --sync 316 293 click 2
  screenshot "Visualiza_kardex"
  detener_video
  sleep 2
}
