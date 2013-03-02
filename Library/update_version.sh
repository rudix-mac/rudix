#!/bin/sh
# Copyright © 2013 Rudix
# Author: Rudá Moura
#
# Update to new version and commit to repository.
#

if [ $# -eq 0 ] ; then
    echo "Usage: $0 VERSION [NAME]"
    echo "Update to version VERSION and commit."
    exit 0
fi
if [ $# -eq 1 ] ; then
    VERSION=$1
    NAME=$(basename `pwd`)
else
    VERSION=$1
    NAME=$2
fi

# Update Makefile information
awk -v version=$VERSION '
BEGIN        { OFS="\t"; }
/^Version=/  { print $1, version; next; }
/^Revision=/ { print $1, 0; next; }
             { print; }' Makefile > Makefile.new
mv Makefile.new Makefile

# Update Description information
awk -v version=$VERSION '
BEGIN       { state="normal" }
/^Release/  { print;
              print "\n* Upgraded to version " version "\n";
              state="in_release";
              next; }
/^Install/   { state="normal"; }
state == "normal" { print; }' Description > Description.new
mv Description.new Description

# Commit changes
git commit . -m "$NAME: Update to version $VERSION. (AUTOMATIC COMMIT)"
echo "Done."
