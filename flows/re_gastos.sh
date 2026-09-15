#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script

ejecutar_registrar_gasto(){
  iniciar_video "$POS_VIDEO_DIR/gasto/registar_gasto_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  press_key F6
  sleep 1     
  screenshot "Registrar_Gasto_F6"
  sleep 2                   
  press_key Tab
  sleep 1
  press_key Tab
  sleep 1
  press_key Return
  press_key Down
  press_key Down
  press_key Return
  sleep 1
  press_key Tab
  press_key Tab
  press_key Tab
  sleep 1
  type_text "30.00"
  sleep 1
  press_key Tab
  xdotool mousemove --sync 814 550 click 1
  sleep 1
  type_text "test gasto" #test_gasto
  sleep 1
  screenshot "Gasto_registrado"
  sleep 2
  xdotool mousemove --sync 1090 807 click 1
  sleep 1
  screenshot "registro_gasto_finalizado"
  sleep 2
  detener_video
}

