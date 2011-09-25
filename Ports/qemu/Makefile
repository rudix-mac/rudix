include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/ConfigureFormula.mk

Description=	QEMU is a generic and open source machine emulator and virtualizer
Site=		http://wiki.qemu.org/
License=	GPL
Title=		QEMU
Name=		qemu
Version=	0.14.1
Revision=	0
URL=		http://download.savannah.gnu.org/releases/qemu/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/qemu-doc.html
LicenseFile=	$(SourceDir)/LICENSE

ConfigureExtra += --enable-cocoa
ConfigureExtra += --disable-bsd-user
ConfigureExtra += --disable-darwin-user


ifdef FOO
	cd $(SourceDir) ; make test
	touch test
endif
