BuildRequires += $(LibDir)/libpng.la
BuildRequires += $(LibDir)/libjpeg.la

include ../../Library/GNU.mk

Title=		Gnuplot
Name=		gnuplot
Version=	4.6.0
Revision=	0
URL=		http://sourceforge.net/projects/gnuplot/files/gnuplot/$(Version)/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/Copyright

GnuConfigureExtra += --with-readline=builtin
