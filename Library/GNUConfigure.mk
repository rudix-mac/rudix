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

define gnu_configure
env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
$(configure) $(CONFIG_OPTS) \
$(if $DISABLE_DEPENDENCY_TRACKING, --disable-dependency-tracking) 
endef

MAKEINSTALLOPTIONS= "DESTDIR=$(INSTALLDIR)"

define gnu_make_install
make $(MAKEINSTALLOPTIONS) install
endef

gcinstallextra=

define gnu_make_check
make check
endef

build: prep $(DEPENDS)
	cd $(BUILDDIR); $(gnu_configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; $(gnu_make_install)
	rm -f $(INSTALLDIR)${PREFIX}/share/info/dir
	rm -f $(INSTALLDIR)${PREFIX}/lib/charset.alias
	rm -f $(INSTALLDIR)${PREFIX}/share/locale/locale.alias
	$(createdocdir)
	$(gcinstallextra)
	for x in $(wildcard $(INSTALLDIR)$(PREFIX)/bin/*); do \
		 strip $$x; \
	done 
	touch install

test: install universal_test
	cd $(BUILDDIR) ; $(gnu_make_check) || $(call error_output,One or more tests failed)
	touch test
