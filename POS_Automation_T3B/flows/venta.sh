#!/usr/bin/env bash
buscar_articulo(){
  local product_key="$1"
  press_key ctrl+b
  sleep 2
  type_text "$product_key"
  press_key Down
  press_key Down
  press_key Return
  sleep 2
}

buscar_articulo_multiplicado(){
  local product_key="$1"
  press_key ctrl+b
  sleep 2
  type_text "$product_key"
  press_key Down
  press_key Down
  press_key Return
  sleep 2
  press_key F5
  press_key 5
  press_key Return
  
}

_add_product_row(){
  local test_case="$1" product_key="$2" cantidad="$3" accion="$4"
  [[ "$accion" == "ADD" ]] || return 0
  local i
  for ((i=1;i<=cantidad;i++)); do buscar_articulo "$product_key"; done
}


ejecutar_venta_articulos(){
  info "Ejecutando Paso 3: Venta de artículos (Data Driven)"
  sleep 3
  iniciar_video "$POS_VIDEO_DIR/venta/venta_$(date +%Y%m%d_%H%M%S).mp4"
  csv_each_row "$POS_DATA_DIR/productos.csv" _add_product_row
  screenshot "03_articulos_agregados"
  press_key F1
  screenshot "04_cerrar_venta"
  type_text "600.00"
  screenshot "05_pago_efectivo_venta"
  press_key F1
  sleep 3
  detener_video
}

ejecutar_venta_articulos_mult(){
  info "Ejecutando Paso 3: Venta de artículos (multiplicado)"
  sleep 3
  iniciar_video "$POS_VIDEO_DIR/venta/venta_multiplicada_$(date +%Y%m%d_%H%M%S).mp4"
  buscar_articulo_multiplicado "18225"
  screenshot "03_articulos_multiplicados_agregados"
  press_key F1
  sleep 2
  type_text "2000.00"
  sleep 2
  press_key F1
  screenshot "04_cerrar_venta_multiplicada"
  sleep 2
  screenshot "05_pago_efectivo_venta_multiplicada"
  press_key F1
  sleep 3
  detener_video
}
