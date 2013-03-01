include ../../Library/GNU.mk

Title=		NASM
Name=		nasm
Version=	2.10.07
Revision=	0
URL=		http://www.nasm.us/pub/nasm/releasebuilds/$(Version)/
Source=		$(Name)-$(Version).tar.bz2

LicenseFile=	$(SourceDir)/LICENSE

MakeInstallExtra += INSTALLROOT=$(PortDir)/$(InstallDir)

define test_inner_hook
$(BinDir)/nasm -v | grep $(Version)
endef
