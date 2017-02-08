include ../../Library/GNU.mk

Title=		Jasper
Name=		jasper
Version=	2.0.10
Site=           http://www.ece.uvic.ca/~frodo/jasper/
Source=		http://www.ece.uvic.ca/~frodo/jasper/software/$(Name)-$(Version).tar.gz
License=        JasPer

LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(BinDir)/jasper --version | grep $(Version)
endef
