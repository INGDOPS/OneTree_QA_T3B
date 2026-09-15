#!/usr/bin/env bash
preguntar_continuidad(){
  if command -v zenity >/dev/null 2>&1; then
    zenity --list --title="Validación QA BOT" \
      --text="Finalizó flujo BOT. ¿Qué deseas hacer?" \
      --column="Acción" \
      "Continuar con Paso 9. Cierre de día" \
      "Reiniciar Flujo BOT 2.0"
  else
    warn "zenity no disponible; se fuerza cierre por seguridad"
    echo "Continuar con Paso 9. Cierre de día"
  fi
}
