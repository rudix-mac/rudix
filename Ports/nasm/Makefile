include ../../Library/GNU.mk

Title=		NASM
Name=		nasm
Version=	2.11.08
Revision=	0
Site=		http://www.nasm.us
Source=		http://www.nasm.us/pub/nasm/releasebuilds/$(Version)/$(Name)-$(Version).tar.bz2
License=	BSD

LicenseFile=	$(SourceDir)/LICENSE

MakeInstallExtra += INSTALLROOT=$(PortDir)/$(InstallDir)

define test_inner_hook
$(BinDir)/nasm -v | grep $(Version)
endef
