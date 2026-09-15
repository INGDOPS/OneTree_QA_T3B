#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script

ejecutar_entrega_valores(){
  info "Ejecutando Entrega de Valores"
  iniciar_video "$POS_VIDEO_DIR/entrega_valores/entrega_valores_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 3
  press_key F7
  sleep 2  
  login "$BOT_USER_GD" "$BOT_PASS_GD"  
  sleep 1
  screenshot "Resumen_entrega_valores"
  sleep 2                   
  xdotool mousemove --sync 1091 747 click 1
  sleep 1
  screenshot "Llenado_campos_entrega_valores"
  sleep 2                   
  xdotool mousemove --sync 711 491 click 1
  sleep 1
  type_text "12345"
  sleep 1
  xdotool mousemove --sync 787 571 click 1
  sleep 1
  type_text "12345"
  sleep 1
  xdotool mousemove --sync 651 655 click 1
  sleep 1
  type_text "1"
  sleep 1
  press_key Tab
  press_key Tab
  press_key Tab
  press_key Return
  sleep 1
  screenshot "Resumen_entrega_valores"
  sleep 1
  xdotool mousemove --sync 1105 739 click 1
  sleep 1
  screenshot "Entrega_valores_finalizada"
  sleep 1
  detener_video
  sleep 2
}
