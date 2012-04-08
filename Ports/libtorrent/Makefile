DEPENDS=	$(BinDir)/pkg-config
DEPENDS+=	$(LibDir)/libsigc-2.0.la

include ../../Library/GNU.mk

Name=		libtorrent
Version=	0.12.6
Revision=	0
URL=		http://libtorrent.rakshasa.no/downloads/
Source=		$(Name)-$(Version).tar.gz


ifdef STATIC_ONLY
CONFIGURE_OPTS=		--enable-static --disable-shared
else
CONFIGURE_OPTS=		--enable-static --enable-shared
endif

prep: retrieve
	tar zxvf $(Source)
	touch prep

build: prep $(DEPENDS)
	cd $(SourceDir) ; \
	env CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" \
		OPENSSL_CFLAGS=-I/usr/include OPENSSL_LIBS=-lcrypto \
		PKG_CONFIG_PATH=/usr/lib/pkgconfig \
	$(configure) $(CONFIGURE_OPTS) \
			--disable-dependency-tracking \
			--with-openssl ; $(make)
	touch build

install: build
	cd $(SourceDir) ; make DESTDIR=$(InstallDir) install
	install -d $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(SourceDir)/{AUTHORS,COPYING,ChangeLog,NEWS,ReadMeFile} $(InstallDir)/$(DocDir)/$(Name)
ifndef STATIC_ONLY
	strip -x -S $(InstallDir)$(LibDir)/lib*.dylib
endif
	strip -x -S $(InstallDir)$(LibDir)/lib*.a
	touch install

test: install
ifndef STATIC_ONLY
	$(test-universal-binary) "$(InstallDir)$(LibDir)/lib*.dylib"
endif
	$(test-universal-binary) "$(InstallDir)$(LibDir)/lib*.a"
	touch test
