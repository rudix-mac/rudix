# -*- mode: makefile -*-
# Rules.mk - Common Rules and Macros
# Copyright (c) 2005-2011 Ruda Moura <ruda@rudix.org>

BUILDSYSTEM=	20110327

VENDOR=		org.rudix
PORTDIR:=	$(shell pwd)
BUILDDIR=	$(NAME)-$(VERSION)-build
UNCOMPRESSEDDIR=$(NAME)-$(VERSION)

PREFIX=		/usr/local
INSTALLDIR=	$(PORTDIR)/$(NAME)-install
INSTALLDOCDIR=	$(INSTALLDIR)${PREFIX}/share/doc/$(NAME)
PKGNAME=	$(PORTDIR)/$(NAME)-$(VERSION)-$(REVISION).pkg
# DMGNAME=	$(PORTDIR)/$(DISTNAME)-$(VERSION)-$(REVISION).dmg
TITLE=		$(NAME) $(VERSION)

PACKAGEMAKER=	/Developer/usr/bin/packagemaker
# CREATEDMG=	/usr/bin/hdiutil create
TOUCH=		@touch
#TOUCH=		@date >
FETCH=		@curl -f -O -C - -L
#FETCH=		@wget -c
MKPMDOC=	../../Library/mkpmdoc.py

# Detect architecture (Intel or PowerPC) and number of CPUs/Cores
ARCH:=		$(shell arch)
NCPU:=		$(shell sysctl -n hw.ncpu)
CPU64BIT:=	$(shell sysctl -n hw.cpu64bit_capable)

# Build flags on Snow Leopard
ARCHFLAGS=	-arch i386 -arch x86_64
CFLAGS=		$(ARCHFLAGS) -Os
CXXFLAGS=	$(ARCHFLAGS) -Os
LDFLAGS=	$(ARCHFLAGS)

ifdef STATIC_ONLY
CONFIG_OPTS+=	--enable-static --disable-shared
endif

# Python variables
PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

#
# Handful macros
#
define configure
./configure \
	--cache-file=$(PORTDIR)/config.cache \
	--mandir=${PREFIX}/share/man \
	--infodir=${PREFIX}/share/info
endef

define make
make -j $(NCPU)
endef

define createdocdir
install -d $(INSTALLDOCDIR)
for x in $(wildcard $(BUILDDIR)/CHANGELOG* \
					$(BUILDDIR)/BUGS* \
					$(BUILDDIR)/COPYING \
					$(BUILDDIR)/INSTALL \
					$(BUILDDIR)/NEWS \
					$(BUILDDIR)/README \
					$(BUILDDIR)/LICENSE \
					$(BUILDDIR)/NOTICE \
					$(BUILDDIR)/ACKS \
					$(BUILDDIR)/ChangeLog \
					$(README) \
					$(LICENSE)); do \
	if [[ -e $$x ]]; then \
		install -m 644 $$x $(INSTALLDOCDIR); \
	fi \
done

define explode_source
case `file -b -z --mime-type $(SOURCE)` in \
	application/x-tar) \
		tar zxf $(SOURCE) ;; \
	application/zip) \
		unzip -o -a -d $(BUILDDIR) $(SOURCE) ;; \
	*) \
		false ;; \
esac
endef

define apply_patches
for patchfile in $(wildcard *.patch patches/*.patch) ; do \
	patch -d $(BUILDDIR) < $$patchfile ; done
endef

define lipo_verify
lipo $$x -verify_arch i386 x86_64 || echo "\033[33mWarning file $$x is not an Universal binary\033[0m"
endef

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
	@echo "  installpkg	install the package created"
	@echo "  installclean	local installation clean-up"
	@echo "  clean		build and local installation clean-up"
	@echo "  distclean	clean-up  many things but keep sources"
	@echo "  realdistclean	clean-up everything else"
	@echo "make without any action does 'make all'"

retrieve:
	$(FETCH) $(URL)/$(SOURCE)
	$(TOUCH) retrieve

prep: retrieve
	$(explode_source)
	mv $(UNCOMPRESSEDDIR) $(BUILDDIR)
	$(apply_patches)
	touch prep

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

# Included as precond in install rule
universal_test:
	@echo "Starting Universal binaries test"
	@for x in $(wildcard $(INSTALLDIR)${PREFIX}/bin/*) ; do \
		${lipo_verify} ; done
	@for x in $(wildcard $(INSTALLDIR)${PREFIX}/sbin/*) ; do \
		${lipo_verify} ; done
	@for x in $(wildcard $(INSTALLDIR)${PREFIX}/lib/*.dylib) ; do \
		${lipo_verify} ; done
	@for x in $(wildcard $(INSTALLDIR)${PREFIX}/lib/*.a) ; do \
		${lipo_verify} ; done
	@for x in $(wildcard $(INSTALLDIR)/$(SITEPACKAGES)/*/*.so) ; do \
		${lipo_verify} ; done
	@echo "Finished Universal binaries test"


pkg: install test pmdoc
	$(PACKAGEMAKER) \
		--doc $(NAME).pmdoc \
		--id $(VENDOR).pkg.$(DISTNAME) \
		--version $(VERSION)-$(REVISION) \
		--title "$(TITLE)" \
	$(if $(wildcard $(PORTDIR)/scripts),--scripts $(PORTDIR)/scripts) \
		--out $(PKGNAME)
	touch pkg

installpkg: pkg
	installer -pkg $(PKGNAME) -target /

installclean:
	rm -rf install $(INSTALLDIR)

pkgclean:
	rm -rf pkg *.pkg

clean: installclean
	rm -rf prep build pmdoc test $(BUILDDIR)

distclean: clean pkgclean
	rm -f config.cache*

realdistclean: distclean
	rm -f retrieve $(SOURCE)

tag:
	@hg tag $(NAME)-$(VERSION)-$(REVISION)

about:
	@echo "$(TITLE) ($(DISTNAME)-$(VERSION)-$(REVISION))"
