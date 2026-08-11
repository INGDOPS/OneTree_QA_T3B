import pyautogui

import time


while True:

    x, y = pyautogui.position()

    print(f"\rX={x} Y={y}", end="")

    time.sleep(0.1)