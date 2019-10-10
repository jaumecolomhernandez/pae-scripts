#!/bin/bash

options=$1

arr=-cbf

first=${options:0:1}

if [[ $first != "-" ]]; then
  echo "You need to indicate the options TBC"
  echo "MES COSES"
fi

if [[ $options =~ "c" ]]; then
  echo "Call compile function"

fi

if [[ $options =~ "b" ]]; then
  echo "Call create bin function"
  # Create .bin
  openthread_output=openthread/output/cc2538/bin

  # First step delete existing .bin files
  bin_files=$openthread_output/*.bin
  rm -rf $bin_files 

  # Then iterate for every file in the output folder
  files=$openthread_output/*
  for fn in $files; do
    echo "Creating "$fn".bin file"
    arm-none-eabi-objcopy -O binary $fn $fn.bin &
  done
fi

if [[ $options =~ "f" ]]; then
  echo "Flashing all the boards with the file: "$file
  # Flash board
  file=$2

  # Path to the flash file
  flash=$openthread_output/$file.bin

  # Get boards connected
  boards=/dev/ttyUSB*
  for board in $boards; do
      echo "Flashing $board with $flash"
      python cc2538-bsl/cc2538-bsl.py -e -w -v -b 115200 -p $board -a 0x00200000 $flash &
  done
fi
