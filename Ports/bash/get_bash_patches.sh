#!/bin/sh

BASH_PATCHES="http://ftp.gnu.org/gnu/bash/bash-4.3-patches/"

for i in `jot 25`
do
    N=`printf "%0.3d" $i`
    curl -O $BASH_PATCHES/bash43-$N
    curl -O $BASH_PATCHES/bash43-$N.sig
done
