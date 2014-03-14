include ../../Library/GNU.mk

Title=		Protocol Buffers
Name=		protobuf
Version=	2.5.0
Revision=	1
Site=		http://code.google.com/p/protobuf/
URL=		http://protobuf.googlecode.com/files/
Source=		$(Name)-$(Version).tar.bz2
License=	BSD

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/COPYING.txt

define test_inner_hook
$(BinDir)/protoc --version | grep $(Version)
endef
