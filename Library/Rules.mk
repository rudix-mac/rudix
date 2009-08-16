# -*- mode: makefile -*-
#
# Common Rules and Macros
# Copyright (c) 2005-2009 Ruda Moura <ruda@rudix.org>
#

BUILDSYSTEM=	1

VENDOR=		org.rudix.pkg
PORTDIR:=	$(shell pwd)
BUILDDIR=	$(PORTDIR)/$(NAME)-$(VERSION)
INSTALLDIR=	$(PORTDIR)/$(NAME)-install
INSTALLDOCDIR=	$(INSTALLDIR)/usr/local/share/doc/$(NAME)
TITLE=		$(NAME) $(VERSION)
PKGNAME=	$(PORTDIR)/$(NAME).pkg
DMGNAME=	$(PORTDIR)/$(NAME)-$(VERSION)-$(REVISION).dmg
PACKAGEMAKER=	/Developer/usr/bin/packagemaker
CREATEDMG=	/usr/bin/hdiutil create
TOUCH=		touch
#TOUCH=		@date >
FETCH=		curl -f -O -C - -L
#FETCH=		wget -c
STRIP_BIN=	strip
STRIP_LIB=	strip -x -S

# Detect architecture (Intel or PowerPC) and number of CPUs/Cores
ARCH:=		$(shell arch)
NCPU:=		$(shell sysctl -n hw.ncpu)

# Universal Binary build flags
CFLAGS=		-arch i386 -arch ppc -Os
CXXFLAGS=	-arch i386 -arch ppc -Os
LDFLAGS=	-arch i386 -arch ppc

# Uncomment this to build Universal Binaries on PowerPC machines
#CFLAGS=	-arch i386 -arch ppc -isysroot /Developer/SDKs/MacOSX10.4u.sdk
#CXXFLAGS=	-arch i386 -arch ppc -isysroot /Developer/SDKs/MacOSX10.4u.sdk
#LDFLAGS=	-arch i386 -arch ppc -isysroot /Developer/SDKs/MacOSX10.4u.sdk

# Intel build flags
CFLAGS_INTEL=	-arch i386 -Os
CXXFLAGS_INTEL=	-arch i386 -Os
LDFLAGS_INTEL=	-arch i386

# PowerPC build flags
CFLAGS_PPC=	-arch ppc -Os
CXXFLAGS_PPC=	-arch ppc -Os
LDFLAGS_PPC=	-arch ppc

# Debugging flags
CFLAGS_DEBUG=	-g
CXXFLAGS_DEBUG=	-g

# Popular web sites
SOURCEFORGE=	http://downloads.sourceforge.net/
GNU=		http://ftp.gnu.org/

ifdef INTEL_ONLY
CFLAGS=		$(CFLAGS_INTEL)
CXXFLAGS=	$(CXXFLAGS_INTEL)
LDLFLAGS=	$(LDFLAGS_INTEL)
endif

# Common rules

all: install

help:
	@echo "make <action> where action is:"
	@echo "  help		this help"
	@echo "  retrieve	retrieve all files necessary to compile"
	@echo "  prep		explode source, apply patches, etc"
	@echo "  build		configure software and then build it"
	@echo "  install	install software into directory $(INTALLDIR)"
	@echo "  pkg		create a package (.pkg)"
	@echo "  dmg		create a disk image (.dmg)"
	@echo "  installpkg	install a package (.pkg) created"
	@echo "  all		executes prep, build and then install"
	@echo "  installclean	(local) install clean-up"
	@echo "  clean		build and install clean-up"
	@echo "  distclean	remove many things but keep sources"
	@echo "  realdistclean	remove everything else"
	@echo "make without any action does 'make all'"

retrieve:
	$(FETCH) $(URL)/$(SOURCE)
	$(TOUCH) retrieve

# prep, build, install are provided by the port's Makefile

pkg: install
	$(PACKAGEMAKER) \
		--doc $(NAME).pmdoc \
		--id $(VENDOR).$(NAME) \
		--version $(VERSION) \
		--title "$(TITLE)" \
	$(if $(wildcard $(PORTDIR)/scripts),--scripts $(PORTDIR)/scripts) \
		--out $(PKGNAME)
	$(TOUCH) pkg

dmg: pkg
	$(CREATEDMG) -srcfolder $(PKGNAME) $(DMGNAME)
	$(TOUCH) dmg

installpkg:
	installer -pkg $(PKGNAME) -target /

installclean:
	rm -rf install $(INSTALLDIR)

pkgclean:
	rm -rf  pkg *.pkg

dmgclean:
	rm -rf dmg *.dmg

clean: installclean
	rm -rf prep build test $(BUILDDIR)

distclean: clean pkgclean dmgclean
	rm -f config.cache*

realdistclean: distclean
	rm -f retrieve $(SOURCE)

tag:
	svn copy . https://rudix.googlecode.com/svn/tags/pool/$(NAME)-$(VERSION)-$(REVISION) -m "Tagging version $(VERSION) revision $(REVISION)"

about:
	@echo "$(TITLE) ($(NAME)-$(VERSION)-$(REVISION))"

# Handful macros

define configure
./configure \
	--cache-file=$(PORTDIR)/config.cache \
	--mandir=/usr/local/share/man \
	--infodir=/usr/local/share/info
endef

define make
make -j $(NCPU)
endef
