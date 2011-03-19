# -*- mode: makefile -*-
#
# Rules.mk - Common Rules and Macros
#
# Copyright (c) 2005-2011 Ruda Moura <ruda@rudix.org>
#

BUILDSYSTEM=	20110316

VENDOR=		org.rudix
DISTNAME=	$(NAME)
PORTDIR:=	$(shell pwd)
BUILDDIR=	$(NAME)-$(VERSION)
INSTALLDIR=	$(PORTDIR)/$(NAME)-install
INSTALLDOCDIR=	$(INSTALLDIR)/usr/local/share/doc/$(NAME)
PKGNAME=	$(PORTDIR)/$(DISTNAME).pkg
DMGNAME=	$(PORTDIR)/$(DISTNAME)-$(VERSION)-$(REVISION).dmg
TITLE=		$(NAME) $(VERSION)

PACKAGEMAKER=	/Developer/usr/bin/packagemaker
CREATEDMG=	/usr/bin/hdiutil create
TOUCH=		touch
#TOUCH=		@date >
FETCH=		curl -f -O -C - -L
#FETCH=		wget -c
MKPMDOC=	../../Library/mkpmdoc.py

# Detect architecture (Intel or PowerPC) and number of CPUs/Cores
ARCH:=		$(shell arch)
NCPU:=		$(shell sysctl -n hw.ncpu)
CPU64BIT:=	$(shell sysctl -n hw.cpu64bit_capable)

# Build flags on Snow Leopard
CFLAGS=		-arch i386 -arch x86_64 -Os
CXXFLAGS=	-arch i386 -arch x86_64 -Os
LDFLAGS=	-arch i386 -arch x86_64

## Build flags on Leopard
#CFLAGS=	-arch i386 -arch ppc -Os
#CXXFLAGS=	-arch i386 -arch ppc -Os
#LDFLAGS=	-arch i386 -arch ppc

## Debug flags:
#CFLAGS=	-ggdb
#CXXFLAGS=	-ggdb
#LDFLAGS=

#
# Build rules
#
all: install

help:
	@echo "make <action> where action is:"
	@echo "  help		this help message"
	@echo "  retrieve	retrieve files necessary to compile"
	@echo "  prep		explode source, apply patches, etc"
	@echo "  build		configure software and then build it"
	@echo "  install	install software into directory $(INTALLDIR)"
	@echo "  all		do prep, build and install"
	@echo "  pkg		create a package (.pkg)"
	@echo "  dmg		create a disk image (.dmg)"
	@echo "  installpkg	install the package created"
	@echo "  installclean	local installation clean-up"
	@echo "  clean		build and local installation clean-up"
	@echo "  distclean	clean-up  many things but keep sources"
	@echo "  realdistclean	clean-up everything else"
	@echo "make without any action does 'make all'"

retrieve:
	$(FETCH) $(URL)/$(SOURCE)
	touch retrieve

# Rules prep, build and install must be defined in your Makefile!

createpmdoc:
	$(MKPMDOC) \
		--name $(NAME) \
		--version $(VERSION)-$(REVISION) \
		--title "$(TITLE)" \
		--description "$(DESCRIPTION)" \
		--readme $(README) \
		--license $(LICENSE) \
		.

CONTENTSXML=	$(NAME).pmdoc/01$(NAME)-contents.xml

pmdoc: install
	$(MAKE) createpmdoc
	sed 's*o="$(USER)"*o="root"*' $(CONTENTSXML) > $(CONTENTSXML)
	sed 's*pt="$(PORTDIR)/*pt="*' $(CONTENTSXML) > $(CONTENTSXML)
	touch pmdoc

universal_test: install
	@echo "Starting Universal binaries test"
	@for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 || echo "\033[33mWarning file $$x is not an Universal binary\033[0m" ; done
	@for x in $(wildcard $(INSTALLDIR)/usr/local/sbin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 || echo "\033[33mWarning file $$x is not an Universal binary\033[0m" ; done
	@for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 || echo "\033[33mWarning file $$x is not an Universal binary\033[0m" ; done
	@for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 || echo "\033[33mWarning file $$x is not an Universal binary\033[0m" ; done
	@echo "Finished Universal binaries test"

pkg: pmdoc test
	$(PACKAGEMAKER) \
		--doc $(NAME).pmdoc \
		--id $(VENDOR).pkg.$(DISTNAME) \
		--version $(VERSION)-$(REVISION) \
		--title "$(TITLE)" \
	$(if $(wildcard $(PORTDIR)/scripts),--scripts $(PORTDIR)/scripts) \
		--out $(PKGNAME)
	touch pkg

dmg: pkg
	$(CREATEDMG) \
		-volname "$(DISTNAME)" \
		-srcfolder $(README) \
		-srcfolder $(LICENSE) \
		-srcfolder $(PKGNAME) $(DMGNAME)
	touch dmg

installpkg: pkg
	installer -pkg $(PKGNAME) -target /

installclean:
	rm -rf install $(INSTALLDIR)

pkgclean:
	rm -rf pkg *.pkg

dmgclean:
	rm -rf dmg *.dmg

clean: installclean
	rm -rf prep build pmdoc test $(BUILDDIR)

distclean: clean pkgclean dmgclean
	rm -f config.cache*

realdistclean: distclean
	rm -f retrieve $(SOURCE)

tag:
	hg tag $(NAME)-$(VERSION)-$(REVISION)

about:
	@echo "$(TITLE) ($(DISTNAME)-$(VERSION)-$(REVISION))"

#
# Handful macros
#
define configure
./configure \
	--cache-file=$(PORTDIR)/config.cache \
	--mandir=/usr/local/share/man \
	--infodir=/usr/local/share/info
endef

define make
make -j $(NCPU)
endef
