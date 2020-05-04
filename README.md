# Faster Project Plus Installer for Linux

A script for compiling Faster Project Plus on Linux. Current Version: **2.1**

Currently tested on Ubuntu, but should work across *all* distributions given the right dependencies. Older versions can be found under `config/legacy/`.

[Join the official Faster Project Plus Discord Channel for support!](https://discord.gg/ZHYxnFp)

## Dependencies needed (install these first!)

### Ubuntu 20.04
If running Ubuntu 20.04 or other distros based on it you must install this dep as well.

`sudo apt install libxxf86vm-dev`

You must also tell the installer you are running it as well. 

## Other Deps

For most users (including Fedora 24+), see [this page](https://wiki.dolphin-emu.org/index.php?title=Building_Dolphin_on_Linux) for an easy to install list of dependencies; otherwise, see below.

### NixOS: 

See [attached README, written by fletchers#4892](../other_distros/NixOS/INSTALL.md)

### Solus (possible list, untested):

`sudo eopkg it -c system.devel`

`sudo eopkg it libgtk-2-devel libgtk-3-devel wxwidgets-devel libsm-devel gtest-devel llvm-devel lzo-devel mbedtls-devel miniupnpc-devel libxrandr-devel libxi-devel alsa-lib-devel bluez-devel mesalib-devel curl-devel enet-devel libevdev-devel pulseaudio-devel libusb-devel openal-soft-devel portaudio-devel sdl2-devel SFML-devel soundtouch-devel git cmake pkg-config gcc readline-devel libxext-devel libao-devel`

## Dependencies Optional

`axel` or `aria2c`

Gives  a fast way to download the SD card. 
Defaults to wget without them.
Wget is extremeley slow by comparision.


Downloading sd card benchmarks

SD card file size 2Gb zipped to 1.6Gb

| UrlDownloader | Download Time |   |
|---------------|---------------|---|
| axel          | 1-2 min(s)    |   |
| aria2c        | 3-4 mins      |   |
| wget          | 15-20 mins    |   |

## Instructions: (READ FULLY BEFORE FOLLOWING)

1. Install necessary dependcies listed using guide above. Don't forget that optional deps will bring fast downloads.
2. Use install script to obtain FPP
3. Move Brawl into FasterProjectPlus/bin/Games directory
4. Run the game by opening the .elf file in dolphin

## To use:

```sh
sh -c "$(curl -Ls https://github.com/Birdthulu/FPM-Installer/raw/master/setup)"
```

If a different version is needed (e.g. not SL default), edit the script and replace the desired variables.

Packed config structure: main folder named `Binaries/`, with  `User/`, `Sys/`, `portable.txt`, and `version-####.txt`(optional) packed inside.

## Changelog
v1.0: Support for versions 2.1 and 2.0.
v2.0: Downloads the sd card for you.
v3.0: Renames the config paths for you.
V3.1: Optional parallel downloads, increases the speed by magnitudes.
v4.0: Added support for Ubuntu 20.04

### Thanks to:

The entire FasterMelee team, without their installer as a base, this would probably not have been written.

They thank the following people so it felt appropriate to thank them here as well:

    /u/ParadigmComplex. "Seriously, I could not have finished the original script without this guy."

    /u/jojorino and Hannesmann: "always testing and helping, as well as the rest of the FM discord!"

    "Also thanks to xanax, CilanMan, /u/algebra123230, /u/folfess for incremental improvements!"

### Faster Melee on Linux:

Want to play Melee on linux?
[Check out the FasterMelee team's installer here!](https://github.com/FasterMelee/FasterMelee-installer)