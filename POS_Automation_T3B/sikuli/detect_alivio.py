# SikuliX 2.x - ejecutado desde runsikulix
# El patrón se basa en la imagen proporcionada por QA.
from sikuli import *

popup = Pattern("popup_alivio.png").similar(0.82)
if exists(popup, 3):
    exit(0)
exit(1)