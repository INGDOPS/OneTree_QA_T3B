#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script

ejecutar_ubicacion_familias(){
  info "Ejecutando Registrar Ubicacion de Familias"
  iniciar_video "$POS_VIDEO_DIR/familias/ubicacion_familias_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 3
  press_key F9
  #xdotool mousemove --sync 45 36 click 1
  sleep 1  
  #xdotool mousemove --sync 224 258 click 1  
  press_key Tab 
  sleep 1
  screenshot "Ubicacion_Familias_F9"
  sleep 2                   
  type_text "aguas"
  sleep 1
  press_key Tab
  press_key Tab
  press_key Tab
  press_key Tab
  press_key Tab
  xdotool mousemove --sync 1563 242 click 1
  press_key crl+a
  sleep 1
  type_text "D0004"
  sleep 2
  screenshot "Familia Modificada"
  xdotool mousemove --sync 1551 960 click 1
  press_key Tab
  press_key Tab
  sleep 1
  screenshot "Familia modificada finalizada"
  press_key Return
  sleep 2
  detener_video
  sleep 2
}
