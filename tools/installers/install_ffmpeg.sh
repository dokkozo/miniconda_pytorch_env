#!/bin/bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <cpu-arch>"
    echo
    echo "e.g.  $0 i686"
    echo "cpu-arch=i686, amd64 arm64 armhf armel,"
    exit 1
fi

CPU=$1

rm -f ffmpeg-release-${CPU}-static.tar.xz
wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-${CPU}-static.tar.xz

rm -rf ffmpeg-*-i686-static
tar xf ffmpeg-release-${CPU}-static.tar.xz
ln -s ffmpeg-*-i686-static ffmpeg-static
