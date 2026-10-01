#!/bin/bash
cd "$(dirname "$0")"
SPCOMMON=${1:-"$HOME/.steam/steam/steamapps/common/Sapiens/SPCommon.dll"}
mkdir -p ../lib
x86_64-w64-mingw32-gcc -O2 -s -shared -static-libgcc -Iinclude -o ../lib/FloraOverhaul.dll FloraOverhaul.c "$SPCOMMON"
gcc -O2 -s -shared -fPIC -Iinclude -o ../lib/libFloraOverhaul.so FloraOverhaul.c
