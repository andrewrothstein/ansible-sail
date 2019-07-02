#!/usr/bin/env sh
VER=v1.0.6
DIR=~/Downloads
MIRROR=https://github.com/cdr/sail/releases/download/$VER

dl()
{
    OS=$1
    PLATFORM=$2
    URL=$MIRROR/sail-$OS-$PLATFORM.tar.gz
    LFILE=$DIR/sail-$OS-$PLATFORM-$VER.tar.gz

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "    # %s\n" $URL
    printf "    %s-%s: sha256:%s\n" $OS $PLATFORM `sha256sum $LFILE | awk '{print $1}'`
}

printf "  %s:\n" $VER
dl linux amd64
dl darwin amd64



