#!/bin/sh
#
# Bump revision.
#
# Copyright © 2013-2014 Rudix
# Author: Rudá Moura

if [ $# -eq 0 ] ; then
    NAME=$(basename `pwd`)
else
    NAME=$1
fi

awk '
BEGIN        { OFS="\t"; }
/^Revision=/ { print $1, $2+1; next; }
             { print; } ' Makefile > Makefile.new && mv Makefile.new Makefile
