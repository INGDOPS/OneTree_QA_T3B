#!/usr/bin/env bash
preguntar_continuidad(){
  if command -v zenity >/dev/null 2>&1; then
    zenity --list --title="Validación QA POS" \
      --text="Finalizó Paso 8. Devolución. ¿Qué deseas hacer?" \
      --column="Acción" \
      "Continuar con Paso 9. Cierre de Turno" \
      "Reiniciar desde Paso 3. Venta de Artículos"
  else
    warn "zenity no disponible; se fuerza cierre por seguridad"
    echo "Continuar con Paso 9. Cierre de Turno"
  fi
}
