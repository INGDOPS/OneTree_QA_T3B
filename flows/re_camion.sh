#!/usr/bin/env bash


ejecutar_pie_camion(){
  info "Ejecutando Registro Pie de Camion"
  iniciar_video "$POS_VIDEO_DIR/camion/registar_pie_camion_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  press_key ctrl+p
  sleep 1     
  screenshot "Registrar_Pie_camion_crl_p"
  sleep 2                   
  press_key Return
  sleep 1
  press_key Down
  press_key Down
  press_key Return
  sleep 1
  type_text "12345678"
  sleep 1
  press_key Return
  sleep 1
  press_key 1
  press_key Tab
  press_key 1
  sleep 1
  screenshot "Entrada_pie_camion"
  xdotool mousemove --sync 1459 946 click 1
  sleep 1
  xdotool mousemove --sync 1276 417 click 1
  press_key 1
  press_key Tab
  sleep 1
  press_key 1
  screenshot "Entrada_pie_camion_segunda_captura"
  sleep 2
  xdotool mousemove --sync 1459 946 click 1
  sleep 1
  xdotool mousemove --sync 1384 848 click 1
  sleep 1
  screenshot "registro_pie_camion_finalizado"
  sleep 2
  detener_video
  sleep 2
}
