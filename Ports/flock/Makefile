include ../../Library/Unix.mk

Title=	        flock
Name=		flock
Version=	0.4.0
Site=		https://github.com/discoteq/flock
Source=		https://github.com/discoteq/flock/archive/v0.4.0.tar.gz
License=	ISC
Description=	flock(1) locks files

ReadMeFile=     $(SourceDir)/README.md
LicenseFile=    $(SourceDir)/LICENSE.md

MakeExtra +=    flock

define before_build_hook
cd $(BuildDir) && ./autogen.sh
endef

define install_hook
install -d $(DestDir)$(BinDir)
install -d $(DestDir)$(ManDir)/man1
install -m 755 $(BuildDir)/$(Name) $(DestDir)$(BinDir)/$(Name)
install -m 644 files/$(Name).1 $(DestDir)$(ManDir)/man1
$(install_base_documentation)
endef
