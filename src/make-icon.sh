#!/usr/bin/env bash

# This requires ImageMagick

convert hello-qt6.png -resize 256x256 -define icon:auto-resize="256,128,96,64,48,32,16" hello-qt6.ico
