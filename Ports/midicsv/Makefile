include ../../Library/Unix.mk

Title=		MIDI CSV
Name=		midicsv
Version=	1.1
Site=		http://www.fourmilab.ch/webtools/midicsv/
Source=		http://www.fourmilab.ch/webtools/midicsv/midicsv-$(Version).tar.gz
License=        Public Domain
LicenseFile=	COPYRIGHT

MakeInstallExtra += INSTALL_DEST=$(DestDir)$(Prefix)

define test_inner_hook
$(BinDir)/midicsv -u 2>&1 | grep $(Version)
$(BinDir)/csvmidi -u 2>&1 | grep $(Version)
endef
