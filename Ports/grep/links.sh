#/bin/sh
cd $1
for i in gnu* ; do
	ln -sf $i ${i##gnu}
done
