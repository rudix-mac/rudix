#!/bin/sh

BASH_PATCHES="http://ftp.gnu.org/gnu/bash/bash-4.4-patches/"

for i in `jot 30`
do
    N=`printf "%0.3d" $i`
    curl -O $BASH_PATCHES/bash44-$N
    curl -O $BASH_PATCHES/bash44-$N.sig
done
