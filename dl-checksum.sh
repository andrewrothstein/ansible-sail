#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/cdr/sail/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local platform="${os}-${arch}"
    local url=$MIRROR/$ver/sail-$platform.tar.gz
    local lfile=$DIR/sail-$platform-$ver.tar.gz

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver linux amd64
    dl $ver darwin amd64
}

dl_ver ${1:-v1.1.0}
