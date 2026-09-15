#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script

ejecutar_transferencia_cedis(){
  info "Ejecutando Transferencia de Mercancia de Tienda a Tienda"
  iniciar_video "$POS_VIDEO_DIR/transferencia/transferencia_cedis_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 3
  xdotool mousemove --sync 49 238 click 1
  sleep 1  
  press_key Tab
  press_key Tab 
  sleep 1
  type_text "Bebida Guayaba Boing"
  sleep 1
  xdotool mousemove --sync 130 230 click 1 
  screenshot "Producto a transferir"
  sleep 2                   
  xdotool mousemove --sync 1665 892 click 1  
  sleep 1
  press_key Tab
  press_key Return
  sleep 1
  press_key Tab
  press_key Tab
  press_key Tab
  sleep 1
  screenshot "Trasferir_cedis"
  sleep 1
  press_key Return
  sleep 1
  type_text "3"
  sleep 2
  xdotool mousemove --sync 938 837 click 1  
  type_text "Prueba automatizada"
  sleep 1
  screenshot "Trasferir_Mercancia_piezas"
  sleep 1
  xdotool mousemove --sync 1456 954 click 1  
  sleep 2
  screenshot "Transferencia_finalizada"
  sleep 1
  detener_video
  sleep 2
}

ejecutar_transferencia_tienda(){
  info "Ejecutando Transferencia de Mercancia de Tienda a Tienda"
  iniciar_video "$POS_VIDEO_DIR/transferencia/transferencia_tienda_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 3
  xdotool mousemove --sync 49 238 click 1
  sleep 1  
  press_key Tab
  press_key Tab 
  sleep 1
  type_text "Bebida Guayaba Boing"
  sleep 1
  xdotool mousemove --sync 130 230 click 1 
  screenshot "Producto a transferir"
  sleep 1
  xdotool mousemove --sync 130 295 click 1   
  sleep 2                   
  xdotool mousemove --sync 1665 892 click 1  
  sleep 1
  screenshot "Trasferir_tienda"
  sleep 1
  press_key Tab
  press_key Tab
  press_key Return
  sleep 1
  press_key Tab
  press_key Tab
  press_key Return
  sleep 2
  login "$BOT_USER_GD" "$BOT_PASS_GD"
  screenshot "Trasferir_Mercancia"
  sleep 2
  type_text "3"
  sleep 1
  press_key Tab
  press_key Tab
  press_key Return
  sleep 1
  type_text "2492"
  sleep 1
  press_key Down
  press_key Down
  press_key Return
  sleep 2
  xdotool mousemove --sync 756 835 click 1  
  type_text "Prueba automatizada"
  sleep 1
  screenshot "Transferencia_tienda_piezas"
  sleep 1
  press_key Tab
  press_key Tab
  press_key Return
  sleep 2
  screenshot "Transferencia_finalizada"
  detener_video
  sleep 2
}
