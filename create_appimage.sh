#!/bin/bash

set -e

cd Ishiiruka

ZSYNC_STRING="gh-releases-zsync|jlambert360|FPM-AppImage|latest|Faster_Project_Plus-x86-64.AppImage.zsync"

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
if [ ! -e ./Tools/${LINUXDEPLOY_FILE} ]; then
	wget ${LINUXDEPLOY_URL} -O ./Tools/${LINUXDEPLOY_FILE}
	chmod +x ./Tools/${LINUXDEPLOY_FILE}
fi
if [ ! -e ./Tools/${UPDATEPLUG_FILE} ]; then
	wget ${UPDATEPLUG_URL} -O ./Tools/${UPDATEPLUG_FILE}
	chmod +x ./Tools/${UPDATEPLUG_FILE}
fi
if [ ! -e ./Tools/${UPDATETOOL_FILE} ]; then
	wget ${UPDATETOOL_URL} -O ./Tools/${UPDATETOOL_FILE}
	chmod +x ./Tools/${UPDATETOOL_FILE}
fi

pwd;
./Tools/${LINUXDEPLOY_FILE} --appdir=./build/AppDir --executable ./build/Binaries/ishiiruka -d ./build/faster-project-plus.desktop -i ./Data/ishiiruka.svg

# Add the Sys dir to the AppDir for packaging
cp -r ./Data/Sys/ ${APPDIR_BIN}

# Package up the update tool within the AppImage
cp ./Tools/${UPDATETOOL_FILE} ${APPDIR_BIN}

# Bake an AppImage with the update metadata
export UPDATE_INFORMATION="${ZSYNC_STRING}"; 
export VERSION="2.28"
./Tools/${UPDATEPLUG_FILE} --appdir=./build/AppDir/;

mv Faster_Project_Plus-$VERSION-x86_64.AppImage Faster_Project_Plus-x86-64.AppImage
mv Faster_Project_Plus-$VERSION-x86_64.AppImage.zsync Faster_Project_Plus-x86-64.AppImage.zsync

