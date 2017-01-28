#!/bin/sh
#
# Bump port revision number.
#
# Copyright © 2013-2017 Rudá Moura (Rudix)
# Author: Rudá Moura <ruda.moura@gmail.com>

if [ $# -eq 0 ] ; then
    NAME=$(basename `pwd`)
else
    NAME=$1
fi

awk '
BEGIN        { OFS="\t"; }
/^Revision=/ { print $1, $2+1; next; }
             { print; } ' Makefile > Makefile.new && mv Makefile.new Makefile

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
