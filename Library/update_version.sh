#!/bin/sh
#
# Update port to a new version.
#
# Copyright © 2013-2017 Rudá Moura (Rudix)
# Author: Rudá Moura <ruda.moura@gmail.com>

if [ $# -eq 0 ] ; then
    echo "Usage: $0 VERSION [NAME]"
    echo "Update to version VERSION."
    exit 0
fi
if [ $# -eq 1 ] ; then
    VERSION=$1
    NAME=$(basename `pwd`)
else
    VERSION=$1
    NAME=$2
fi

awk -v version=$VERSION '
BEGIN        { OFS="\t"; }
/^Version=/  { print $1, version; next; }
             { print; }' Makefile > Makefile.new && mv Makefile.new Makefile

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
