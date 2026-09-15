#!/usr/bin/env bash
set -u
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$ROOT_DIR/config/environment.conf"
source "$ROOT_DIR/core/logger.sh"
source "$ROOT_DIR/core/keyboard.sh"
source "$ROOT_DIR/core/wait.sh"
source "$ROOT_DIR/core/screenshot.sh"
source "$ROOT_DIR/core/video.sh"
source "$ROOT_DIR/core/csv.sh"
source "$ROOT_DIR/core/sikuli.sh"
source "$ROOT_DIR/core/validation.sh"
source "$ROOT_DIR/flows/login.sh"
source "$ROOT_DIR/flows/re_camion.sh"
source "$ROOT_DIR/flows/re_merma.sh"
source "$ROOT_DIR/flows/re_gastos.sh"
source "$ROOT_DIR/flows/re_mercancia.sh"
source "$ROOT_DIR/flows/re_familias.sh"
source "$ROOT_DIR/flows/re_transferencia.sh"
source "$ROOT_DIR/flows/re_musica.sh"
source "$ROOT_DIR/flows/re_pedido.sh"
source "$ROOT_DIR/flows/re_etiquetas.sh"
source "$ROOT_DIR/flows/re_kardex.sh"
source "$ROOT_DIR/flows/re_dashboard.sh"
source "$ROOT_DIR/flows/re_precios.sh"
source "$ROOT_DIR/flows/re_entrega_valores.sh"
source "$ROOT_DIR/flows/cierre.sh"
source "$ROOT_DIR/flows/continuidad.sh"

mkdir -p "$POS_SCREEN_DIR" "$POS_VIDEO_DIR" "$POS_LOG_DIR"

validate_dependencies || exit 1
require_credentials || { error "Define las credenciales como variables de entorno antes de ejecutar."; exit 1; }

info "Iniciando flujo automatizado BOT 2.0"
activate_bot
sleep 3

#run_login_open_shift
run_login_block_shift

while true; 
do
  #ejecutar_entrega_valores
  ejecutar_pedido_eficiente #actualizar flujo 
  ejecutar_configuracion_etiquetas_masivo
  ejecutar_impresion_precios
  #ejecutar_confirmacion_fondeo_inicial
  #ejecutar_recibir_mercancia
  ejecutar_merma
  #ejecutar_registrar_gasto
  ejecutar_pie_camion
  ejecutar_ubicacion_familias
  ejecutar_rep_musica
  #ejecutar_kardex
  ejecutar_transferencia_tienda #revisar
  ejecutar_transferencia_cedis #revisar
  ejecutar_dashboard_efectivo
  ejecutar_dashboard_productos
  ejecutar_dashboard_ventas
  #ejecutar_confirmacion_fondeo_inicial
  #ejecutar_cierre_turno_pos
  

  
  RESPUESTA="$(preguntar_continuidad || true)"
  if [[ "$RESPUESTA" == "Continuar con ultimo paso. Cierre de Día" ]]; then
    ejecutar_cierre_dia
    break
  elif [[ "$RESPUESTA" == "Reiniciar Flujo BOT 2.0" ]]; then
    info "Reiniciando Flujo BOT 2.0..."
    screenshot "reinicio_desde_paso_3"
  else
    warn "No se seleccionó opción. Por seguridad se continúa con cierre de turno."
    ejecutar_cierre_dia
    break
  fi
done
