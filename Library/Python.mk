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
	cd $(BUILDDIR) ; $(pysetupbuild)
	touch build

install: build
	cd $(BUILDDIR) ; \
	$(pysetupinstall) ; $(pycompileall) ; \
	$(createdocdir)
	shopt -s nullglob; for x in $(INSTALLDIR)/$(SITEPACKAGES)/*/*.so; do \
		 strip -x $$x; \
	done
	touch install

test: install
	touch test

