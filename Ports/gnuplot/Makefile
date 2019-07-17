include ../../Library/GNU.mk

Title=		Gnuplot
Name=		gnuplot
Version=	5.2.7
Site=		http://www.gnuplot.info/
Source=		http://sourceforge.net/projects/gnuplot/files/gnuplot/$(Version)/$(Name)-$(Version).tar.gz
License=	Gnuplot license
LicenseFile=	$(SourceDir)/Copyright

BuildRequires += $(BinDir)/lua # lua
BuildRequires += $(LibDir)/liblua.a # lua

GnuConfigureExtra += --with-readline=builtin
GnuConfigureExtra += --with-aquaterm
GnuConfigureExtra += --disable-wxwidgets
GnuConfigureExtra += --with-x=no
GnuConfigureExtra += --with-qt=no
GnuConfigureExtra += --with-gd=yes
GnuConfigureExtra += --with-cairo=yes
# GnuConfigureExtra += --with-mif=yes
GnuConfigureExtra += --without-tutorial

MakeExtra += LUA_CFLAGS="-I/usr/local/include"
MakeExtra += LUA_LIBS="-L/usr/local/lib -llua"

define test_hook
$(BinDir)/gnuplot --version | grep $(Version)
endef
