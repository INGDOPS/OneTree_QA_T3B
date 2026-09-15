#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script

ejecutar_configuracion_etiquetas_especificas(){
  info "Ejecutando Configuracion de Etiquetas"
  iniciar_video "$POS_VIDEO_DIR/etiquetas/configuracion_etiquetas_especificas$(date +%Y%m%d_%H%M%S).mp4"
  sleep 3
  press_key F10
  #xdotool mousemove --sync 45 36 click 1
  sleep 2  
  #xdotool mousemove --sync 224 258 click 1  
  press_key Tab 
  press_key Tab
  press_key Tab
  press_key Tab
  press_key Tab
  press_key Tab
  press_key Tab
  press_key Tab
  press_key Tab
  press_key Return
  press_key Return
  sleep 1
  screenshot "Configuracion_etiquetas_familia"
  sleep 2                   
  xdotool mousemove --sync 1475 311 click 1
  sleep 1
  xdotool mousemove --sync 1483 397 click 1
  sleep 1
  screenshot "Configuracion_etiquetas_tipo_flechas_arriba"
  sleep 2                   
  xdotool mousemove --sync 1642 312 click 1
  sleep 1
  screenshot "Configuracion_etiquetas_tipo_flechas_arriba_detalle"
  sleep 2 
  press_key Tab
  press_key Return
  sleep 1                  
  xdotool mousemove --sync 1485 357 click 1
  sleep 1
  xdotool mousemove --sync 1471 473 click 1
  sleep 1
  screenshot "Configuracion_etiquetas_tipo_flechas_abajo"
  sleep 2                   
  xdotool mousemove --sync 1642 352 click 1
  sleep 1
  screenshot "Configuracion_etiquetas_tipo_flechas_abajo_detalle"
  sleep 2 
  press_key Tab
  press_key Return
  sleep 1
  xdotool mousemove --sync 1635 923 click 1
  sleep 1
  xdotool mousemove --sync 1489 921 click 1
  sleep 1
  detener_video
  sleep 2
}

ejecutar_configuracion_etiquetas_masivo(){
  info "Ejecutando Configuracion de Etiquetas Masivo"
  iniciar_video "$POS_VIDEO_DIR/etiquetas/configuracion_etiquetas_masivo$(date +%Y%m%d_%H%M%S).mp4"
  sleep 3
  press_key F10
  #xdotool mousemove --sync 45 36 click 1
  sleep 2  
  xdotool mousemove --sync 465 838 click 1 
  sleep 1
  press_key Tab 
  press_key Tab
  press_key Tab
  press_key Tab
  press_key Return
  sleep 1
  screenshot "Configuracion_etiquetas_familia_masivo"
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 1
  xdotool mousemove --sync 218 267 click 1
  sleep 1
  xdotool mousemove --sync 1658 838 click 1
  sleep 2
  #corregir a 400 con 17 paginas
  xdotool mousemove --sync 1403 735 click 1
  press_key Tab 
  press_key Tab
  xdotool mousemove --sync 1413 854 click 1
  sleep 1
  screenshot "Configuracion_etiquetas_masiva_abajo"
  sleep 1
  xdotool mousemove --sync 1580 740 click 1
  sleep 1
  xdotool mousemove --sync 1634 924 click 1
  sleep 1
  xdotool mousemove --sync 1496 920 click 1
  sleep 6
  screenshot "Configuracion_etiquetas_masiva_finalizado"
  sleep 2
  detener_video
  sleep 6
}
