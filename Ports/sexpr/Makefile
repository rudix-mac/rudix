include ../../Library/GNU.mk

Title=		sfsexp
Name=		sexpr
Version=	1.2.1
Revision=	1
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)_$(Version).tar.gz

LicenseFile=	$(SourceDir)/LICENSE

UncompressedName=$(Name)_$(Version)

MakeExtra += CFLAGS="$(CFlags)" LDFLAGS="$(LdFlags)"

define install_post_hook
install -d $(InstallDir)$(Prefix)/include/sexpr
install -m 644 $(SourceDir)/src/*.h $(InstallDir)$(Prefix)/include/sexpr
install -d $(InstallDir)$(LibDir)
install -m 644 $(SourceDir)/src/libsexp.a $(InstallDir)$(LibDir)
install -m 644 $(SourceDir)/*.txt $(InstallDir)/$(DocDir)/$(Name)
endef
