include ../../Library/GNU.mk

Title=		GNU Autoconf
Name=		autoconf
Version=	2.69
Revision=	0
URL=		http://ftp.gnu.org/gnu/autoconf/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define final_inner_hook
$(BinDir)/autoconf --version
endef
