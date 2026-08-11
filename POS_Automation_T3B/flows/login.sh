#!/usr/bin/env bash
run_login_open_shift(){
  info "Paso 1/2: Login AV y apertura de turno"
  iniciar_video "$POS_VIDEO_DIR/login/login_$(date +%Y%m%d_%H%M%S).mp4"
  sleep 2
  login "$POS_USER_AV" "$POS_PASS_AV"
  screenshot "01_login_av"
  sleep 2
  press_key ctrl+a
  sleep 2
  press_key F1
  sleep 3
  login "$POS_USER_TRAINEE" "$POS_PASS_TRAINEE"
  screenshot "02_apertura_turno_trainee"
  press_key F1
  sleep 2
  detener_video
}
