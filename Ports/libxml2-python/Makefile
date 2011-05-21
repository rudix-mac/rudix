# Python bindings for libxml2
# http://xmlsoft.org/python.html
# MIT

include ../../Library/Rules.mk

Name=		libxml2-python
Version=	2.6.21
Revision=	0
URL=		ftp://xmlsoft.org/libxml2/python/
Source=		$(Name)-$(Version).tar.gz

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	cd $(SourceDir) ; tar zxvf $(Source)
	touch prep

build: prep $(DEPENDS)
	cd $(SourceDir) ; $(PYTHON) setup.py build
	touch build

install: build
	cd $(SourceDir) ; \
	$(PYTHON) setup.py install \
		--no-compile \
		--root=$(InstallDir) \
		--prefix=$(Prefix) \
		--install-lib=$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(InstallDir)
	install -d $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(SourceDir)/{ReadMeFile,TODO,*.xml,*.txt} $(InstallDir)/$(DocDir)/$(Name)
	strip -x $(InstallDir)/$(SITEPACKAGES)/*.so
	touch install

test: install
	for x in $(wildcard $(InstallDir)/$(SITEPACKAGES)/*.so) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
