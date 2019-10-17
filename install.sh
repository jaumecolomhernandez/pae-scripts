#!/bin/bash

# This script installs all the pae scripts into the /usr/bin folder
# Requires sudo onl

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
echo $SCRIPT

rm -rf /usr/bin/pae_*
cp $SCRIPTPATH/pae_* /usr/bin/
