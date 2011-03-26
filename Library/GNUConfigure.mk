
DISABLE_DEPENDENCY_TRACKING= "yes"

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

gcinstallextra= ""


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
	for x in $(BUILDDIR)/{CHANGELOG*, BUGS*, COPYING,INSTALL,NEWS,README,LICENSE,NOTICE}; do \
		if [[ -e $$x ]]; then \
			install -m 644 $$x $(INSTALLDOCDIR); \
		fi \
	done
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	$(gcinstallextra)
	if [[ -d $(INSTALLDIR)${PREFIX}/bin ]]; then strip $(INSTALLDIR)$(PREFIX)/bin/*; fi
	if [[ -d $(INSTALLDIR)${PREFIX}/sbin ]]; then strip $(INSTALLDIR)${PREFIX}/sbin/*; fi
	if [[ -d $(INSTALLDIR)${PREFIX}/lib ]]; then strip -x $(INSTALLDIR)${PREFIX}/lib/lib*.dylib; fi
	if [[ -d $(INSTALLDIR)${PREFIX}/lib ]]; then strip -x $(INSTALLDIR)${PREFIX}/lib/lib*.a; fi
	touch install

test: install
	cd $(BUILDDIR) ; $(gcmakecheck) || echo "\033[33mOne or more tests failed\033[0m"
	touch test
