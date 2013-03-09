include ../../Library/GNU.mk

Title=		ccache
Name=		ccache
Version=	3.1.9
Revision=	2
URL=		http://samba.org/ftp/ccache/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/ccache --version
endef
