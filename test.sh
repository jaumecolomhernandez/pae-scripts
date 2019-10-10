#!/bin/bash

options=$1

arr=-cbf

first=${options:0:1}

if [[ $first != "-" ]]; then
  echo "You need to indicate the options TBC"
fi

if [[ $options =~ "c" ]]; then
  echo "Call compile function"
fi

if [[ $options =~ "b" ]]; then
  echo "Call create bin function"
fi

if [[ $options =~ "f" ]]; then
  echo "Call flash function"
fi