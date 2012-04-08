BuildRequires += $(BinDir)/pcre-config

include ../../Library/GNU.mk

Title=		lighttpd
Name=		lighttpd
Version=	1.4.30
Revision=	0
URL=		http://download.lighttpd.net/lighttpd/releases-1.4.x/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-openssl
GnuConfigureExtra += --libdir=$(LibDir)/lighttpd

define install_post_hook
install -m 644 $(PortDir)/lighttpd.conf.default \
	$(InstallDir)$(Prefix)/etc/lighttpd
endef

ifdef FOO
install: build
	cd $(SourceDir) ; make DESTDIR=$(InstallDir) install
	install -d $(InstallDir)$(Prefix)/etc/lighttpd
	install -d $(InstallDir)$(Prefix)/var/{www,log/lighttpd,run}
	install -d $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(SourceDir)/{AUTHORS,COPYING,NEWS,ReadMeFile,doc/[a-z]*} $(InstallDir)/$(DocDir)/$(Name)
	rm -f $(InstallDir)/$(DocDir)/$(Name)/doc/*.1
	strip $(InstallDir)$(Prefix)/sbin/*
	strip -x $(InstallDir)$(LibDir)/lighttpd/lib*.dylib
	strip -x $(InstallDir)$(LibDir)/lighttpd/mod_*.so
	touch install

endif
