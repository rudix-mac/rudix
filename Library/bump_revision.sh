#!/bin/sh
# Copyright © 2013 Rudix
# Author: Rudá Moura
#
# Bump revision and commit to repository.
#

if [ $# -eq 0 ] ; then
    NAME=$(basename `pwd`)
else
    NAME=$1
fi

# Bump revision on Makefile
awk '
BEGIN        { OFS="\t"; }
/^Revision=/ { print $1, $2+1; next; }
             { print; } ' Makefile > Makefile.new
mv Makefile.new Makefile

# Commit change
git commit . -m "$NAME: Bump revision. (AUTOMATIC COMMIT)"
echo "Done."
