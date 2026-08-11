#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script

recarga_por_nombre(){
  local nombre="$1"
  awk -F';' -v n="$nombre" 'NR>1 && $1==n {print $2; exit}' "$POS_DATA_DIR/tiempo_aire.csv"
}

buscar_recarga(){
  local texto="$1"
  type_text "$texto"
  sleep 1
  press_key Down
  press_key Down
  press_key Return
}

tiempo_aire_csv(){
  local nombre="$1" search_text="$2" importe="${3:-200.00}" #efectivo="${4:-500.00}"
  local referencia
  referencia="$(recarga_por_nombre "$nombre")"
  [[ -n "$referencia" ]] || { error "No se encontró referencia para: $nombre"; return 1; }

  info ": $nombre | referencia: $referencia"
  press_key F10
  screenshot "06_pago_tiempo_aire"
  buscar_recarga "$search_text"
  screenshot "07_recarga_seleccionada"
  press_key F1
  sleep 4
  type_text "$referencia"
  press_key Tab
  sleep 3
  type_text "$referencia"
  press_key Tab
  sleep 1
  type_text "$importe"
  sleep 2
  screenshot "08_confirmacion_recarga"
  press_key F1
  sleep 15
  press_key F1
  screenshot "09_recarga_finalizada"
  sleep 3

}

ejecutar_tiempo_aire(){
  info "Ejecutando Paso 5: Tiempo aire"
  sleep 3
  iniciar_video "$POS_VIDEO_DIR/tiempo_aire/tiempo_aire_$(date +%Y%m%d_%H%M%S).mp4"
  tiempo_aire_csv "RE 150 Unefon" "RE 150 Unefon" "200.00" #"500.00"
  detener_video
}
