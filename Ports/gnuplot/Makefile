BuildRequires += $(BinDir)/lua # lua

include ../../Library/GNU.mk

Title=		Gnuplot
Name=		gnuplot
Version=	4.6.3
Revision=	0
URL=		http://sourceforge.net/projects/gnuplot/files/gnuplot/$(Version)/
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	$(SourceDir)/Copyright

GnuConfigureExtra += --with-readline=builtin
