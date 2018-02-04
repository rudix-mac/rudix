include ../../Library/Configure.mk

Title=		Node.js®
Name=		node
Version=	9.5.0
Site=		http://nodejs.org/
Source=		http://nodejs.org/dist/v$(Version)/$(Name)-v$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName=$(Name)-v$(Version)

define test_hook
$(BinDir)/node --version | grep $(Version)
$(BinDir)/npm --version | grep 5.6.0
nm $(BinDir)/node | grep 't _ssl_new'
endef
