#/bin/sh
cd $1
for i in gnu* ; do
    ln -sf $i ${i##gnu}
done
# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
