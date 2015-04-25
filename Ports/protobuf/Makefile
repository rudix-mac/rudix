include ../../Library/GNU.mk

Title=		Protocol Buffers
Name=		protobuf
Version=	2.6.1
Revision=	0
Site=		https://developers.google.com/protocol-buffers/
Source=		https://github.com/google/protobuf/releases/download/$(Version)/$(Name)-$(Version).tar.bz2
License=	BSD

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(BinDir)/protoc --version | grep $(Version)
endef
