#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script


ejecutar_dashboard_efectivo(){
  info "Ejecutando Dashboard Efectivo"
  iniciar_video "$POS_VIDEO_DIR/dasboard/dashboard_efectivo_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  xdotool mousemove --sync 49 450 click 1
  sleep 2
  screenshot "Dasboard_efectivo"
  sleep 2
  detener_video
  sleep 3
}



ejecutar_dashboard_productos(){
  info "Ejecutando Dashboard Productos"
  iniciar_video "$POS_VIDEO_DIR/dasboard/dashboard_productos_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  xdotool mousemove --sync 49 245 click 1
  sleep 2
  screenshot "Dasboard_productos"
  sleep 2
  detener_video
  sleep 3
}


ejecutar_dashboard_ventas(){
  info "Ejecutando Dashboard Ventas"
  iniciar_video "$POS_VIDEO_DIR/dasboard/dashboard_ventas_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  xdotool mousemove --sync 47 348 click 1
  sleep 2
  screenshot "Dasboard_venta_fisicas"
  sleep 2                   
  xdotool mousemove --sync 444 107 click 1
  sleep 2
  screenshot "Dashboard_venta_servicios"
  xdotool mousemove --sync 351 32 click 1
  sleep 2
  detener_video
  sleep 3
}
