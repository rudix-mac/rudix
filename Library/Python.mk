# Python variables
PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

define pysetupbuild
env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" ARCHFLAGS="$(ARCHFLAGS)" \
$(PYTHON) setup.py build
endef

define pysetupinstall
$(PYTHON) setup.py install \
	--no-compile \
	--root=$(INSTALLDIR) \
	--prefix=$(PREFIX) \
	--install-lib=$(SITEPACKAGES)
endef

define pycompileall
$(PYTHON) -m compileall -d / $(INSTALLDIR)
endef

build: prep $(DEPENDS)
	$(call pre_build_hook)
	cd $(BUILDDIR) ; $(pysetupbuild)
	$(call post_build_hook)
	touch build

install: build
	$(call pre_install_hook)
	cd $(BUILDDIR) ; \
	$(pysetupinstall) ; $(pycompileall) ; \
	$(createdocdir)
	shopt -s nullglob; for x in $(INSTALLDIR)/$(SITEPACKAGES)/*/*.so; do \
		 strip -x $$x; \
	done
	$(call post_install_hook)
	touch install

test: install
	$(call pre_test_hook)
	$(call post_test_hook)
	touch test
