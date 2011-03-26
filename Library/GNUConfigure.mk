
DISABLE_DEPENDENCY_TRACKING= "yes"

define atconfigure
env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
$(configure) $(CONFIG_OPTS) \
$(if $DISABLE_DEPENDENCY_TRACKING, --disable-dependency-tracking) 
endef

define atmake
$(make)
endef

MAKEINSTALLOPTIONS= "DESTDIR=$(INSTALLDIR)"

define atmakeinstall
make $(MAKEINSTALLOPTIONS) install
endef

define atmakecheck
make check|| echo "\033[33mOne or more tests failed\033[0m"
endef

build: prep $(DEPENDS)
	cd $(BUILDDIR); $(atconfigure)
	cd $(BUILDDIR); $(atmake)
	touch build

install: build
	cd $(BUILDDIR) ; $(atmakeinstall)
	rm -f $(INSTALLDIR)${PREFIX}/share/info/dir
	rm -f $(INSTALLDIR)${PREFIX}/lib/charset.alias
	rm -f $(INSTALLDIR)${PREFIX}/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	for x in $(BUILDDIR)/{COPYING,INSTALL,NEWS,README,LICENSE}; do \
		if [[ -e $$x ]]; then \
			install -m 644 $$x $(INSTALLDOCDIR); \
		fi \
	done
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	if [[ -d $(INSTALLDIR)${PREFIX}/bin ]]; then strip $(INSTALLDIR)$(PREFIX)/bin/*; fi
	if [[ -d $(INSTALLDIR)${PREFIX}/sbin ]]; then strip $(INSTALLDIR)${PREFIX}/sbin/*; fi
	if [[ -d $(INSTALLDIR)${PREFIX}/lib ]]; then strip -x $(INSTALLDIR)${PREFIX}/lib/lib*.dylib; fi
	if [[ -d $(INSTALLDIR)${PREFIX}/lib ]]; then strip -x $(INSTALLDIR)${PREFIX}/lib/lib*.a; fi
	touch install

test: install
	cd $(BUILDDIR) ; $(atmakecheck)
	touch test
