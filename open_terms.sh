#!/bin/bash

boards=/dev/ttyUSB*
for board in $boards; do
    gnome-terminal -e 'python -m serial.tools.miniterm '$board' 115200' &
done