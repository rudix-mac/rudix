# A portable and retargetable assembler

include ../../Library/Unix.mk

Title=		vasm
Name=		vasm
Version=	1.8g
Site=		http://sun.hasenbraten.de/vasm/
Source=		http://sun.hasenbraten.de/vasm/release/vasm.tar.gz
Source=		http://server.owl.de/~frank/tags/vasm1_8g.tar.gz
License=	Non-free
ReadMeFile=     $(SourceDir)/doc/vasm.texi
LicenseFile=    LEGAL

UncompressedName=vasm


define build_hook
cd $(BuildDir) && \
	for cpu in z80 6502 6800 x86 ; do \
		$(make) CPU=$$cpu SYNTAX=std ; \
	done && \
	for cpu in z80 6502 6800 x86 ; do \
		$(make) CPU=$$cpu SYNTAX=oldstyle ; \
	done && \
	$(make) CPU=m68k SYNTAX=mot
endef

define install_hook
install -d $(DestDir)$(BinDir)
install -m 755 $(BuildDir)/vasm*_std $(DestDir)$(BinDir)
install -m 755 $(BuildDir)/vasm*_oldstyle $(DestDir)$(BinDir)
install -m 755 $(BuildDir)/vasm*_mot $(DestDir)$(BinDir)
install -m 755 $(BuildDir)/vobjdump $(DestDir)$(BinDir)
$(install_base_documentation)
$(strip_macho)
endef
