include ../../Library/GNU.mk

Title=		sfsexp
Name=		sexpr
Version=	1.2.1
Site=		http://sexpr.sourceforge.net/
Source=		http://downloads.sourceforge.net/$(Name)/$(Name)_$(Version).tar.gz
License=	LGPL

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName=$(Name)_$(Version)

MakeExtra += CFLAGS="$(CFlags)" LDFLAGS="$(LdFlags)"

define after_install_hook
install -d $(InstallDir)$(Prefix)/include/sexpr
install -m 644 $(SourceDir)/src/*.h $(InstallDir)$(Prefix)/include/sexpr
install -d $(InstallDir)$(LibDir)
install -m 644 $(SourceDir)/src/libsexp.a $(InstallDir)$(LibDir)
install -m 644 $(SourceDir)/*.txt $(InstallDir)/$(DocDir)/$(Name)
endef
