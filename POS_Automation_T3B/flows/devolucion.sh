#!/usr/bin/env bash
ejecutar_devolucion(){
  info "Ejecutando Paso 8: Devolución"
  iniciar_video "$POS_VIDEO_DIR/devolucion/devolucion_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 3
  press_key F7
  screenshot "17_devolucion_f7"
  sleep 2
  #Cliente no comforme
  buscar_articulo "23937"
  screenshot "18_articulo_devolucion_04972"
  sleep 2
  screenshot "19_aceptar_devolucion"
  sleep 2
  press_key Return
  press_key Down
  press_key Return
  press_key Tab
  press_key Tab
  press_key Return
  sleep 2
  #Mala calidad 
  buscar_articulo "18225"
  screenshot "18_articulo_devolucion_04972"
  sleep 2
  screenshot "19_aceptar_devolucion_Cliente_no_conforme"
  sleep 2
  press_key Tab
  press_key Tab
  press_key Return
  sleep 2
  press_key F1
  sleep 1
  press_key F1
  sleep 1
  login "$POS_USER_TRAINEE" "$POS_PASS_TRAINEE"
  screenshot "20_login_devolucion"
  press_key F1
  sleep 3
  press_key F1
  detener_video
  sleep 3
}
