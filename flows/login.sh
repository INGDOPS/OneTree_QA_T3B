#!/usr/bin/env bash
run_login_open_shift(){
  info "Paso 1/2: Login GT y apertura de DÍa"
  iniciar_video "$POS_VIDEO_DIR/login/login_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  login "$BOT_USER_GT" "$BOT_PASS_GT"
  screenshot "01_login_gt"
  sleep 2
  press_key ctrl+a
  sleep 3
  screenshot "02_apertura_dia_GT"
  sleep 2
  detener_video
}

run_login_block_shift(){
  info "Paso 1/2: Login GT y apertura de Dia"
  iniciar_video "$POS_VIDEO_DIR/login/login_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  login "$BOT_USER_GT" "$BOT_PASS_GT"
  screenshot "00_bloqueo_sesion_gt"
  sleep 2
  detener_video
}