include ../../Library/GNU.mk

Title=		ccache
Name=		ccache
Version=	3.2.1
Revision=	0
Site=		https://ccache.samba.org
Source=		https://samba.org/ftp/ccache//$(Name)-$(Version).tar.bz2
Checksum=	6441f394720b3ab0498fa8e817e2851399c23095
License=	GPL

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/ccache --version | grep $(Version)
endef
