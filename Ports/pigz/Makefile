include ../../Library/Unix.mk

Title=		pigz (parallel gzip)
Name=		pigz
Version=	2.3
Revision=	0
Site=		http://zlib.net/pigz/
Source=		http://zlib.net/pigz//$(Name)-$(Version).tar.gz
License=	zlib

ReadMeFile=	$(SourceDir)/README
LicenseFile=	LICENSE

define install_inner_hook
install -d $(DestDir)$(BinDir)
install -m 755 $(SourceDir)/{pigz,unpigz} $(DestDir)$(BinDir)
install -d $(DestDir)$(ManDir)/man1
install -m 644 $(SourceDir)/pigz.1 $(DestDir)$(ManDir)/man1
$(install_base_documentation)
endef

define test_inner_hook
$(BinDir)/pigz --version
$(BinDir)/unpigz --version
endef
