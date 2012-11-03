include ../../Library/GNU.mk

Title=		GNU Libidn
Name=		libidn
Version=	1.25
Revision=	0
URL=		http://ftp.gnu.org/gnu/libidn/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define test_inner_hook
$(BinDir)/idn --version
endef
