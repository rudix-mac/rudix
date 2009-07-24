#/bin/sh

if test x"$1" = x""; then
	echo "Directory required"
	exit 1;
fi

cd $1
for i in gnu* ; do
	ln -sf $i ${i##gnu}
done
