BuildRequires += $(LibDir)/libgc.la # static-gc

include ../../Library/GNU.mk

Title=		GNU Zile
Name=		zile
Version=	2.4.9
Revision=	0
URL=		http://ftp.gnu.org/gnu/zile/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define test_inner_hook
$(BinDir)/zile --version
endef
