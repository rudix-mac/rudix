include ../../Library/GNU.mk

Title=		cadaver
Name=		cadaver
Version=	0.23.3
Revision=	4
URL=		http://www.webdav.org/cadaver/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-ssl

define build_inner_hook
$(call info_color,Running Configure)
cd $(BuildDir) ; env CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)" $(EnvExtra) $(gnu_configure)
$(call info_color,Done)
pushd $(BuildDir)/lib/intl ; $(make) $(MakeExtra) ; popd # hack
cd $(BuildDir) ; $(make) $(MakeExtra)
endef

define install_post_hook
install -m 644 $(SourceDir)/{FAQ,INTEROP} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(call test_universal)
endef
