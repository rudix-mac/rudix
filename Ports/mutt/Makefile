BuildRequires += $(LibDir)/libintl.la

include ../../Library/GNU.mk

Title=		Mutt
Name=		mutt
Version=	1.5.21
Revision=	3
URL=		ftp://ftp.mutt.org/mutt/devel/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYRIGHT

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
define prep_post_hook
#perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif

GnuConfigureExtra += -enable-pop --enable-imap --enable-smtp --with-ssl
GnuConfigureExtra += 

ifdef FOO
build: prep $(DEPENDS)
	cd $(SourceDir) ; env CFLAGS="$(CFLAGS)" \
	$(configure) \
		--disable-dependency-tracking \
		--with-docdir=$(DocDir)/mutt  \
		--enable-pop --enable-imap --enable-smtp \
		--with-ssl $(NLS) $(HCACHE) ; $(make)
	touch build

install: build
	cd $(SourceDir) ; make DESTDIR=$(InstallDir) install
	mv $(InstallDir)$(Prefix)/etc/Muttrc $(INSTALLDIR)/usr/local/etc/Muttrc.default
	mv $(InstallDir)$(Prefix)/etc/mime.types $(INSTALLDIR)/usr/local/etc/mime.types.default
	rm -rf $(InstallDir)$(LibDir)
	rm -f $(InstallDir)$(Prefix)/share/locale/locale.alias
	install -d $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(SourceDir)/{NEWS,ReadMeFile*,TODO,Version} $(InstallDir)/$(DocDir)/$(Name)
	strip $(InstallDir)$(BinDir)/*
	touch install

test: install
	lipo $(InstallDir)$(BinDir)/mutt -verify_arch i386 x86_64
	lipo $(InstallDir)$(BinDir)/mutt_dotlock -verify_arch i386 x86_64
	for x in $(wildcard $(InstallDir)$(BinDir)/pgp*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test

FOO

# WARNING: Put this on mutt.pmdoc
# chown root:mail	$(BinDir)/mutt_dotlock
# chmod g+s 		$(BinDir)/mutt_dotlock
