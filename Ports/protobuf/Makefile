include ../../Library/GNU.mk

Title=		Protocol Buffers
Name=		protobuf
Version=	3.5.1
Site=		https://developers.google.com/protocol-buffers/
Source=		https://github.com/google/protobuf/releases/download/v$(Version)/$(Name)-all-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(BinDir)/protoc --version | grep $(Version)
endef
