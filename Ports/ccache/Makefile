include ../../Library/GNU.mk

Title=		ccache
Name=		ccache
Version=	3.2.2
Revision=	0
Site=		https://ccache.samba.org
Source=		https://samba.org/ftp/ccache/$(Name)-$(Version).tar.bz2
Checksum=	1f0d9d5786b15fbb1e50de16896d71bbfa0e4e6c
License=	GPL

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/ccache --version | grep $(Version)
endef
