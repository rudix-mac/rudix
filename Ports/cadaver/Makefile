include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	Command-line WebDAV client
Site=		http://www.webdav.org/cadaver/
License=	GPL
Title=		cadaver $(Version)
Name=		cadaver
Version=	0.23.3
Revision=	2
URL=		http://www.webdav.org/cadaver/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-ssl

define install_post_hook
install -m 644 $(SourceDir)/{FAQ,INTEROP} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(call test_universal)
endef
