include ../../Library/GNU.mk

Title=		ccache
Name=		ccache
Version=	3.1.10
Revision=	0
Site=		https://ccache.samba.org
Source=		https://samba.org/ftp/ccache//$(Name)-$(Version).tar.bz2
Checksum=	f78154d526b98546c27e5ef480354f3ce021abe2
License=	GPL

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/ccache --version | grep $(Version)
endef
