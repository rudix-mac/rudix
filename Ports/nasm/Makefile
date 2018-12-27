include ../../Library/GNU.mk

Title=		NASM
Name=		nasm
Version=	2.14.02
Site=		http://www.nasm.us
Source=		http://www.nasm.us/pub/nasm/releasebuilds/$(Version)/$(Name)-$(Version).tar.bz2
License=	BSD

LicenseFile=	$(SourceDir)/LICENSE

MakeInstallExtra += INSTALLROOT=$(PortDir)/$(InstallDir)

define test_hook
$(BinDir)/nasm -v | grep $(Version)
endef
