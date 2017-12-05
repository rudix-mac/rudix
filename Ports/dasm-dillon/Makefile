include ../../Library/Unix.mk

Title=		dasm
Name=		dasm
Version=	2.20.11
Release=	2.20.11-20140304
Site=		http://dasm-dillon.sourceforge.net
Source=		http://downloads.sourceforge.net/dasm-dillon/dasm-2.20.11-2014.03.04-source.tar.gz
License=	GPL
Description=	Versatile macro-assembler for several 8-bit microprocessors

ReadMeFile=     $(SourceDir)/README
LicenseFile=    $(SourceDir)/COPYING

define build_pre_hook
mv dasm-$(Release) dasm-$(Version)
endef

define install_hook
mkdir -p $(InstallDir)/$(DocDir)/$(Name)-$(Version) $(InstallDir)/$(ManDir)/man1 $(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/bin/$(Name) $(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/bin/ftohex $(InstallDir)/$(BinDir)
install -m 644 $(BuildDir)/doc/ftohex.txt $(InstallDir)/$(DocDir)/$(Name)-$(Version)
install -m 644 $(BuildDir)/doc/dasm.txt $(InstallDir)/$(DocDir)/$(Name)-$(Version)
install -m 644 $(BuildDir)/doc/dasm.1 $(InstallDir)/$(ManDir)/man1
endef
