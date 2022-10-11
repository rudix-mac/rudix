#!/bin/sh

BASH_PATCHES="https://ftp.gnu.org/gnu/bash/bash-5.2-patches/"

for i in `jot 2`
do
    N=`printf "%0.3d" $i`
    curl -LRO $BASH_PATCHES/bash52-$N
    mv bash52-$N patches/bash52-$N.patch
done
