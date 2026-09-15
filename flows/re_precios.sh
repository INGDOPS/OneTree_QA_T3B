#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script

ejecutar_impresion_precios(){
  info "Ejecutando impresion de presios"
  iniciar_video "$POS_VIDEO_DIR/presio/impresion_presios_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  xdotool mousemove --sync 1839 159 click 1
  sleep 1     
  screenshot "Impresion_presios"
  sleep 2                   
  xdotool mousemove --sync 1434 308 click 1
  sleep 1
  type_text "1"
  sleep 1
  press_key Down
  sleep 1
  type_text "1"
  sleep 1
  press_key Down
  sleep 1
  type_text "1"
  sleep 1
  #press_key Down
  #sleep 1
  #type_text "1"
  #sleep 1

  xdotool mousemove --sync 1493 951 click 1
  sleep 1
  screenshot "Impresion_visualizar"
  sleep 1
  xdotool mousemove --sync 1625 943 click 1
  sleep 2
  xdotool mousemove --sync 964 622 click 1
  sleep 2
  screenshot "Impresion_finalizada"
  sleep 2
  detener_video
}

