#!/bin/bash

set -e

cd Ishiiruka

ZSYNC_STRING="gh-releases-zsync|Birdthulu|FPM-AppImage|latest|Faster_Project_Plus-x86_64.AppImage.zsync"

LINUXDEPLOY_PATH="https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous"
LINUXDEPLOY_FILE="linuxdeploy-x86_64.AppImage"
LINUXDEPLOY_URL="${LINUXDEPLOY_PATH}/${LINUXDEPLOY_FILE}"

UPDATEPLUG_PATH="https://github.com/linuxdeploy/linuxdeploy-plugin-appimage/releases/download/continuous"
UPDATEPLUG_FILE="linuxdeploy-plugin-appimage-x86_64.AppImage"
UPDATEPLUG_URL="${UPDATEPLUG_PATH}/${UPDATEPLUG_FILE}"

UPDATETOOL_PATH="https://github.com/AppImage/AppImageUpdate/releases/download/continuous"
UPDATETOOL_FILE="appimageupdatetool-x86_64.AppImage"
UPDATETOOL_URL="${UPDATETOOL_PATH}/${UPDATETOOL_FILE}"

APPDIR_BIN="./build/AppDir/usr/bin"

# Grab various appimage binaries from GitHub if we don't have them
if [ ! -e ./Tools/linuxdeploy ]; then
	wget ${LINUXDEPLOY_URL} -O ./Tools/linuxdeploy
	chmod +x ./Tools/linuxdeploy
fi
if [ ! -e ./Tools/linuxdeploy-update-plugin ]; then
	wget ${UPDATEPLUG_URL} -O ./Tools/linuxdeploy-update-plugin
	chmod +x ./Tools/linuxdeploy-update-plugin
fi
if [ ! -e ./Tools/appimageupdatetool ]; then
	wget ${UPDATETOOL_URL} -O ./Tools/appimageupdatetool
	chmod +x ./Tools/appimageupdatetool
fi

./Tools/linuxdeploy --appdir=./build/AppDir --executable ./build/Binaries/ishiiruka -d ./Data/ishiiruka.desktop -i ./Data/ishiiruka.png

# Add the Sys dir to the AppDir for packaging
cp -r Data/Sys ${APPDIR_BIN}

# Package up the update tool within the AppImage
cp ./Tools/appimageupdatetool ${APPDIR_BIN}

# Bake an AppImage with the update metadata
export UPDATE_INFORMATION="${ZSYNC_STRING}"; 
./Tools/linuxdeploy-update-plugin --appdir=./build/AppDir/;
