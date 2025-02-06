# mpv config

![mpv logo](https://raw.githubusercontent.com/mpv-player/mpv.io/master/source/images/mpv-logo-128.png)

## Overview

**mpv** is a free (as in freedom and free beer), open-source, and cross-platform media player. It supports
a wide variety of media file formats, audio and video codecs, and subtitle types.

This repo contains my personal mpv configurations and scripts that I use and are significantly better than default mpv, VLC, and MPC. Before installing, please take your time to read this whole README as common issues can be easily solved by simply reading carefully.


## Preview

[![preview.png](https://codeberg.org/Flatbed0220/mpv-config/raw/branch/main/preview.png)](https://codeberg.org/Flatbed0220/mpv-config/raw/branch/main/preview.png)

# Installation

### Windows

Here are the steps to install mpv and to use my configuration files on Windows:
* Download the latest 64bit mpv Windows build by shinchiro from [mpv.io/installation](https://mpv.io/installation/) or directly from [here](https://sourceforge.net/projects/mpv-player-windows/files/) and extract it wherever you please. This is now your mpv folder
* Run `mpv-install.bat`, which is located in `installer` folder, with administrator priviledges by right-clicking and selecting Run as administrator
* Download the `mpv-config-windows.zip` file from this repo's [latest release](https://codeberg.org/Flatbed0220/mpv-config/releases/latest) and extract it to your mpv folder. Make sure the configuration folder name is `portable_config` (**this is important**) and is located at the same directory as `mpv.exe`


* To make some scripts work, you need to modify them from the release a little bit:

  * In order for the `mpv-cut.lua` script to work, it requires [FFmpeg](https://ffmpeg.org/) and [node](https://nodejs.org/en). See the [installation instructions](https://github.com/f0e/mpv-cut) from the script's source repository for further info.

* **(Optional)** Make your own mpv configuration. You can do that by modifying my configuration files and/or making your own from scratch or modifying others' configurations. Check out the [useful links](#useful-links) section for mpv configuration guides.


* You're all set up. Go watch some videos!


# Scripts

Scripts used:
* audio-visualizer.lua 
  [source](https://github.com/mfcc64/mpv-scripts#visualizerlua)\
  Various audio visualization. It only works if you open audio files.
  
* autoload.lua 
  [source](https://github.com/mpv-player/mpv/blob/master/TOOLS/lua/autoload.lua)\
  Automatically load playlist entries before and after the currently playing file, by scanning the directory.

* copy-time.lua 
  [source](https://github.com/linguisticmind/mpv-scripts/tree/master/copy-time)\
  Copies current timecode in HH:MM:SS.MS format to clipboard. Cross-platform (Mac, Windows, Linux).

* cycle-commands.lua 
  [source](https://github.com/CogentRedTester/mpv-scripts#cycle-commands)\
  Cycles through a series of commands on a keypress. Each iteration of the cycle can contain as many commands as one wants. Syntax details are at the top of the file.

* cycle-profile.lua 
  [source](https://github.com/CogentRedTester/mpv-scripts#cycle-profile)\
  Cycles through a list of profiles sent via a script message and prints the profile-desc to the OSD. More details at the top of the file.

* uosc 
  [source](https://github.com/tomasklaen/uosc)\
 Feature-rich minimalist proximity-based UI for MPV player. 

* mpv-cut 
  [source](https://github.com/familyfriendlymikey/mpv-cut)\
 An mpv plugin for cutting videos incredibly quickly. 

* playlistmanager.lua 
  [source](https://github.com/jonniek/mpv-playlistmanager)\
  Allows you to see and interact with your paylist in an intuitive way.

* seek-to.lua 
  [source](https://github.com/dexeonify/mpv-config/blob/main/scripts/seek-to.lua)\
  Seek to an absolute timestamp specified via keyboard input or pasted from clipboard.

* thumbfast.lua 
 [source](https://github.com/po5/thumbfast)\
  High-performance on-the-fly thumbnailer for mpv. **The script does not display thumbnails on its own**, it is meant to be used alongside a UI script that calls thumbfast.

Configuration files for these scripts can be found in the `script-opts` folder. I also modified some of these scripts' default keybindings. To see my modifications, look for script keybindings in `input.conf`.

## Shaders


* Anime4K — [source](https://github.com/bloc97/Anime4K)\
 A High-Quality Real Time Upscaler for Anime Video 


Use shaders based on your preference and system capabilities. For more info about shaders, read the resources in the [useful links](#useful-links) section.

## Useful Links

* [mpv manual](https://mpv.io/manual/master/)\
  Extremely useful for knowing what certain options do and what to put in `mpv.conf`
* [mpv User Scripts](https://github.com/mpv-player/mpv/wiki/User-Scripts)\
  Compilation of useful community-published scripts to be used with mpv
* [mpv.conf guide](https://iamscum.wordpress.com/guides/videoplayback-guide/mpv-conf/) by iamscum\
  I personally recommend this one over Kokomins'
* [mpv Configuration Guide for Watching Videos](https://kokomins.wordpress.com/2019/10/14/mpv-config-guide/) by Kokomins
* [Mathematically Evaluating mpv's Upscaling Algorithms](https://artoriuz.github.io/blog/mpv_upscaling.html) by João Vitor Chrisóstomo
* [How to Play 10-Bit Video & Show Thumbnails in Windows 10](https://youtu.be/Obf3j1bALY8)

## Official Links

* [mpv homepage](https://mpv.io/)  
* [mpv wiki](https://github.com/mpv-player/mpv/wiki)
* [mpv FAQ](https://github.com/mpv-player/mpv/wiki/FAQ)
* [mpv manual](https://mpv.io/manual/stable/)


