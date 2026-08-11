# POS Automation V3 - Refactorización

Refactor del script POS entregado por QA. El objetivo es separar responsabilidades sin cambiar el flujo activo del POS.

## Estructura
- `main.sh`: orquestador.
- `config/`: configuración y rutas.
- `core/`: teclado, espera, screenshots, video, CSV, SikuliX y validaciones.
- `flows/`: login, venta, servicios, alivio, devolución, cierre.
- `data/`: CSV Data Driven.
- `images/`: recursos visuales.
- `sikuli/`: scripts SikuliX e imagen de referencia.

## Migración Data Driven
### Venta
`data/productos.csv` conserva exactamente los 6 artículos del script original y la selección `Down + Down + Enter`.

### Servicios
`data/servicios.csv` conserva la data adjunta. El flujo activo usa `Pago de Servicios FC Luz CFE`, primera referencia (`821970704543`), importe `400.00` y efectivo `500.00`, igual que la función CFE activa del script original.

## Credenciales
No se almacenan en el repositorio. Antes de ejecutar:
```bash
export POS_USER_AV='TU_USUARIO_AV'
export POS_PASS_AV='TU_PASSWORD_AV'
export POS_USER_TRAINEE='TU_USUARIO_TRAINEE'
export POS_PASS_TRAINEE='TU_PASSWORD_TRAINEE'
```

## Ubuntu
```bash
sudo apt update
sudo apt install -y xdotool ffmpeg scrot gnome-screenshot zenity
```
SikuliX es opcional en esta versión: si no está disponible, el detector de alivio usa el fallback de `xdotool`.

## Ejecutar
```bash
cd POS-Automation-V3-Refactor
./main.sh

## Nota de compatibilidad
El script original tenía `run_login_open_shift` comentado y ejecutaba alivio manual siempre después de `ejecutar_alivio_si_aparece`. Esta versión conserva esas dos decisiones para no modificar el comportamiento actual. Si se quiere corregir esa lógica, debe hacerse en una historia separada.
