#!/usr/bin/env bash
# Flujo genérico. La ejecución por defecto usa el servicio activo del script


ejecutar_rep_musica(){
  info "Ejecutando Reproductor de Musica"
  iniciar_video "$POS_VIDEO_DIR/musica/reproductor_musica_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  xdotool mousemove --sync 351 32 click 1
  sleep 2
  screenshot "Pausar_reproductor_musica"
  sleep 2                   
  xdotool mousemove --sync 351 32 click 1
  sleep 2
  screenshot "Reproducir_musica"
  sleep 2
  detener_video
  sleep 3
}
