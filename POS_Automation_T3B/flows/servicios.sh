#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script

servicio_por_nombre(){
  local nombre="$1"
  awk -F';' -v n="$nombre" 'NR>1 && $1==n {print $2; exit}' "$POS_DATA_DIR/servicios.csv"
}

buscar_servicio(){
  local texto="$1"
  type_text "$texto"
  sleep 1
  press_key Tab
  press_key Down
  #press_key Return
}

pagar_servicio_csv(){
  local nombre="$1" search_text="$2" importe="${3:-400.00}" efectivo="${4:-500.00}"
  local referencia
  referencia="$(servicio_por_nombre "$nombre")"
  [[ -n "$referencia" ]] || { error "No se encontró referencia para: $nombre"; return 1; }

  info "Pago servicio: $nombre | referencia: $referencia"
  press_key F9
  screenshot "10_pago_servicios"
  buscar_servicio "$search_text"
  screenshot "11_servicio_seleccionado"
  sleep 2
  press_key F1
  sleep 3
  type_text "$referencia"
  press_key Tab
  sleep 3
  type_text "$referencia"
  press_key Tab
  sleep 3
  type_text "$importe"
  press_key Tab
  sleep 3
  type_text "$importe"
  screenshot "12_confirmacion_servicio"
  sleep 2
  press_key F1
  sleep 2
  type_text "$efectivo"
  screenshot "13_efectivo_servicio"
  press_key F1
  sleep 15
  press_key F1
  sleep 2
  screenshot "14_servicio_finalizado"
  sleep 3
}

ejecutar_pago_servicios(){
  info "Ejecutando Paso 6: Pago de servicios (CSV)"
  sleep 3
  iniciar_video "$POS_VIDEO_DIR/servicios/servicios_$(date +%Y%m%d_%H%M%S).mp4"
  # Preserva el comportamiento del script activo: FC Luz CFE + referencia cfe + 400/500.
  pagar_servicio_csv "Pago de Servicios RE Multiservicios Tota" "Pago de Servicios RE Multiservicios Tota" "400.00" "500.00"
  detener_video
}
