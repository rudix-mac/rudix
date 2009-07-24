#/bin/sh
cd $1 $2
for i in * ; do
	ln -sf $i ${i}${2}
done