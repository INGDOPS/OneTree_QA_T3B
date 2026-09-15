#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script


ejecutar_pedido_eficiente(){
  info "Ejecutando Realizar Pedido Eficiente"
  iniciar_video "$POS_VIDEO_DIR/pedido/pedido_eficiente_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  screenshot "Realizar_pedido_eficiente"
  sleep 1
  xdotool mousemove --sync 1847 160 click 1
  sleep 2                   
  login "$BOT_USER_GT" "$BOT_PASS_GT"
  sleep 2
  screenshot "Pedido_eficiente"
  sleep 2
  xdotool mousemove --sync 1539 922 click 1
  sleep 2
  screenshot "Pedido_efciente_resumen"
  sleep 2
  xdotool mousemove --sync 1337 847 click 1
  sleep 2
  screenshot "Pedido_efciente_finalizado"
  detener_video
  sleep 3
}
