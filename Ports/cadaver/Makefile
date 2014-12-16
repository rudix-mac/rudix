include ../../Library/GNU.mk

Title=		Cadaver
Name=		cadaver
Version=	0.23.3
Revision=	5
Site=		http://www.webdav.org/cadaver/
URL=		http://www.webdav.org/cadaver/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

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
$(BinDir)/cadaver --version | grep $(Version)
endef
