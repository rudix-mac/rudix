#ifdef WITHOUT_NLS
#CONFIG_OPTS=	--disable-nls
#else
#DEPENDS+=	/usr/local/lib/libintl.la
#CONFIG_OPTS=	--enable-nls
#endif

#ifdef WITH_STATIC_NLS
#LDFLAGS+=	-framework CoreFoundation -liconv
#endif

DISABLE_DEPENDENCY_TRACKING=yes

define gnu_configure
env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
$(configure) $(CONFIG_OPTS) \
$(if $DISABLE_DEPENDENCY_TRACKING,--disable-dependency-tracking) 
endef

MAKEINSTALLOPTIONS="DESTDIR=$(INSTALLDIR)"

define gnu_make_install
make $(MAKEINSTALLOPTIONS) install
endef

define gnu_make_check
make check
endef

build: prep $(DEPENDS)
	@$(call info_output,"Building from source")
	$(call pre_build_hook)
	cd $(BUILDDIR); $(gnu_configure) ; $(make)
	$(call post_build_hook)
	@$(call info_output,"Finished")
	@touch build

install: build
	@$(call info_output,"Installing now")
	$(call pre_install_hook)
	cd $(BUILDDIR) ; $(gnu_make_install)
	rm -f $(INSTALLDIR)${PREFIX}/share/info/dir
	rm -f $(INSTALLDIR)${PREFIX}/lib/charset.alias
	rm -f $(INSTALLDIR)${PREFIX}/share/locale/locale.alias
	$(createdocdir)
	for x in $(wildcard $(INSTALLDIR)$(PREFIX)/bin/*); do \
		 strip $$x; \
	done 
	$(call post_install_hook)
	@$(call info_output,"Finished")
	touch install

test: install universal_test
	$(call pre_test_hook)
	cd $(BUILDDIR) ; $(gnu_make_check) || $(call error_output,One or more tests failed)
	$(call post_test_hook)
	touch test
