include ../../Library/GNU.mk

Title=		Compiler Cache
Name=		ccache
Version=	3.1.9
Revision=	3
Site=		https://ccache.samba.org
URL=		https://samba.org/ftp/ccache/
Source=		$(Name)-$(Version).tar.bz2
Checksum=	e80a5cb7301e72f675097246d722505ae56e3cd3
License=	GPL

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/ccache --version | grep $(Version)
endef
