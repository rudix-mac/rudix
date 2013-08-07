BuildRequires += $(LibDir)/libpng.la # static-libpng

include ../../Library/Configure.mk

Title=		OptiPNG
Name=		optipng
Version=	0.7.4
Revision=	0
URL=		http://downloads.sourceforge.net/optipng
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

MakeInstallExtra += mandir=$(ManDir)
ConfigureExtra += --with-system-libpng

define test_inner_hook
$(BinDir)/optipng --version
endef
