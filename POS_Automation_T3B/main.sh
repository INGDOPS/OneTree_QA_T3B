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
source "$ROOT_DIR/flows/venta.sh"
source "$ROOT_DIR/flows/tiempo_aire.sh"
source "$ROOT_DIR/flows/servicios.sh"
source "$ROOT_DIR/flows/alivio.sh"
source "$ROOT_DIR/flows/devolucion.sh"
source "$ROOT_DIR/flows/cierre.sh"
source "$ROOT_DIR/flows/continuidad.sh"

mkdir -p "$POS_SCREEN_DIR" "$POS_VIDEO_DIR" "$POS_LOG_DIR"

validate_dependencies || exit 1
require_credentials || { error "Define las credenciales como variables de entorno antes de ejecutar."; exit 1; }

info "Iniciando flujo automatizado POS 2.0"
activate_pos
sleep 3

run_login_open_shift

while true; 
do
  ejecutar_venta_articulos
  ejecutar_alivio_manual
  ejecutar_alivio_automatico
  ejecutar_tiempo_aire
  ejecutar_pago_servicios
  ejecutar_alivio_si_aparece
  ejecutar_venta_articulos_mult
  ejecutar_alivio_automatico
  ejecutar_alivio_automatico
  ejecutar_alivio_automatico
  ejecutar_devolucion
  ejecutar_alivio_automatico

  RESPUESTA="$(preguntar_continuidad || true)"
  if [[ "$RESPUESTA" == "Continuar con Paso 9. Cierre de Turno" ]]; then
    ejecutar_cierre_turno
    break
  elif [[ "$RESPUESTA" == "Reiniciar desde Paso 3. Venta de Artículos" ]]; then
    info "Reiniciando desde Paso 3. Venta de Artículos..."
    screenshot "reinicio_desde_paso_3"
  else
    warn "No se seleccionó opción. Por seguridad se continúa con cierre de turno."
    ejecutar_cierre_turno
    break
  fi
done
