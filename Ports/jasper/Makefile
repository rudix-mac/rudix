include ../../Library/GNU.mk

Title=		Jasper
Name=		jasper
Version=	1.900.1
Revision=	0
Site=           http://www.ece.uvic.ca/~frodo/jasper/
Source=		http://www.ece.uvic.ca/~frodo/jasper/software//$(Name)-$(Version).zip
License=        JasPer

LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(BinDir)/jasper --version | grep $(Version)
endef
