
#ifdef WITHOUT_NLS
#CONFIG_OPTS=	--disable-nls
#else
#DEPENDS+=	/usr/local/lib/libintl.la
#CONFIG_OPTS=	--enable-nls
#endif

#ifdef WITH_STATIC_NLS
#LDFLAGS+=	-framework CoreFoundation -liconv
#endif

DISABLE_DEPENDENCY_TRACKING= yes

define gcconfigure
env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
$(configure) $(CONFIG_OPTS) \
$(if $DISABLE_DEPENDENCY_TRACKING, --disable-dependency-tracking) 
endef

define gcmake
$(make)
endef

MAKEINSTALLOPTIONS= "DESTDIR=$(INSTALLDIR)"

define gcmakeinstall
make $(MAKEINSTALLOPTIONS) install
endef

gcinstallextra=


define gcmakecheck
make check
endef

build: prep $(DEPENDS)
	cd $(BUILDDIR); $(gcconfigure)
	cd $(BUILDDIR); $(gcmake)
	touch build

install: build
	cd $(BUILDDIR) ; $(gcmakeinstall)
	rm -f $(INSTALLDIR)${PREFIX}/share/info/dir
	rm -f $(INSTALLDIR)${PREFIX}/lib/charset.alias
	rm -f $(INSTALLDIR)${PREFIX}/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	for x in $(wildcard $(BUILDDIR)/CHANGELOG* \
						$(BUILDDIR)/BUGS* \
						$(BUILDDIR)/COPYING \
						$(BUILDDIR)/INSTALL \
						$(BUILDDIR)/NEWS \
						$(BUILDDIR)/README \
						$(BUILDDIR)/LICENSE \
						$(BUILDDIR)/NOTICE \
						$(README) \
						$(LICENSE)); do \
		if [[ -e $$x ]]; then \
			install -m 644 $$x $(INSTALLDOCDIR); \
		fi \
	done
	$(gcinstallextra)
	for x in $(wildcard $(INSTALLDIR)$(PREFIX)/bin/*); do \
		 strip $$x; \
	done 
	touch install

test: install
	cd $(BUILDDIR) ; $(gcmakecheck) || echo "\033[33mOne or more tests failed\033[0m"
	touch test
