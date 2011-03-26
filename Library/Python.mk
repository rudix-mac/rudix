
define pysetupbuild
ARCHFLAGS=$(ARCHFLAGS);$(PYTHON) setup.py build
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
	cd $(BUILDDIR) ; $(pysetupinstall)
	$(pycompileall)
	strip -x $(INSTALLDIR)/$(SITEPACKAGES)/*/*.so
	touch install

test:
	
