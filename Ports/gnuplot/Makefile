BuildRequires += $(BinDir)/lua # lua

include ../../Library/GNU.mk

Title=		Gnuplot
Name=		gnuplot
Version=	5.0.0
Revision=	0
Site=		http://www.gnuplot.info/
URL=		http://sourceforge.net/projects/gnuplot/files/gnuplot/$(Version)/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

LicenseFile=	$(SourceDir)/Copyright

GnuConfigureExtra += --with-readline=builtin
