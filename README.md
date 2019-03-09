Kosmos, The All-in-One Package
===========================
*formerly known as SDFilesSwitch*

This handy All-in-One package includes everything you need to run Hekate / Atmosphere with some extra patches to enhance your experience.

## [Join us on Discord](https://discord.gg/qbRAuy7)
## [Donations](https://www.patreon.com/atlasnx)

## Features
* Up-to-date, autobuilt packages
* Firmware launching and sleep mode for every firmware
* No issues after starting games after launching homebrew
* Splash Screens and instant launch
* Game mods
* A background FTP-Server
* Atmosphere
* Signature Patches
* NSP installation
* Automatic updating through your console
* Completely customizable button bindings for the Homebrew Loader
* Completely modular
* Drag and drop
* Background netcheat system
* Auto-boot selection through Horizon
* Module selection through Horizon
**and much more!**

## How to use
1. Download the version of your choice and extract it to the root of your Switch SD card or alternatively, build it yourself
2. Start hekate through e.g. [TegraSharp](https://github.com/simontime/TegraSharp/releases), [Fusée Gelée](https://github.com/reswitched/fusee-launcher) or [WebCFWLoader](https://elijahzawesome.github.io/web-cfw-loader/)
3. ???
4. Profit!

## How to build
Set up a DevkitPRO enviroment as per [this](https://switchbrew.org/wiki/Setting_up_Development_Environment)
Clone the repo recursively with `git clone https://github.com/AtlasNX/Kosmos -b Autobuild --recursive`
Open an Msys(Devkit) or bash shell and install the required dependencies with `pacman -S libnx switch-tools switch-portlibs \
    switch-freetype switch-libconfig switch-libjpeg-turbo switch-zlib \
    switch-bzip2 switch-sdl2_gfx switch-sdl2_image switch-sdl2_ttf switch-libpng switch-mesa`
Run `make release` to build everything from the latest release or `make nightly` to builds everything from the latest commit
This should take a while. After it is done, out files should be in a newly created directory called `out`

## Featuring
* [Atmosphère](https://github.com/Atmosphere-NX/Atmosphere)
* [Switch Homebrew Menu](https://github.com/switchbrew/nx-hbmenu)
* [Switch Homebrew Loader](https://github.com/switchbrew/nx-hbloader)
* [Switch Homebrew Appstore](https://github.com/vgmoose/appstorenx)
* [EdiZon](https://github.com/thomasnet-mc/EdiZon)
* [Kosmos-Updater](https://github.com/AtlasNX/Kosmos-Updater)
* [Sys-FTPD](https://github.com/jakibaki/sys-ftpd)
* [Sys-Netcheat](https://github.com/jakibaki/sys-netcheat)
* [CFW-Settings](https://github.com/AtlasNX/CFW-Settings)
* [Ldn_mitm](https://github.com/spacemeowx2/ldn_mitm)
