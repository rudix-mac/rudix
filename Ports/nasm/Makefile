include ../../Library/GNU.mk

Title=		NASM
Name=		nasm
Version=	2.11.05
Revision=	0
Site=		http://www.nasm.us
URL=		http://www.nasm.us/pub/nasm/releasebuilds/$(Version)/
Source=		$(Name)-$(Version).tar.bz2
License=	BSD

LicenseFile=	$(SourceDir)/LICENSE

MakeInstallExtra += INSTALLROOT=$(PortDir)/$(InstallDir)

define test_inner_hook
$(BinDir)/nasm -v | grep $(Version)
endef
