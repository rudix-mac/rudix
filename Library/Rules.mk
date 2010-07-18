# -*- mode: makefile -*-
#
# Common Rules and Macros
# Copyright (c) 2005-2009 Ruda Moura <ruda@rudix.org>
#

BUILDSYSTEM=	2

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
STRIP_LIB=	strip -x

# Detect architecture (Intel or PowerPC) and number of CPUs/Cores
ARCH:=		$(shell arch)
NCPU:=		$(shell sysctl -n hw.ncpu)
CPU64BIT:=	$(shell sysctl -n hw.cpu64bit_capable)

# Universal Binary build flags on Snow Leopard
CFLAGS_FAT=	-arch i386 -arch x86_64 -Os
CXXFLAGS_FAT=	-arch i386 -arch x86_64 -Os
LDFLAGS_FAT=	-arch i386 -arch x86_64

# i386 build flags
CFLAGS_32=	-arch i386 -Os
CXXFLAGS_32=	-arch i386 -Os
LDFLAGS_32=	-arch i386

# x86_64 build flags
CFLAGS_64=	-arch x86_64 -Os
CXXFLAGS_64=	-arch x86_64 -Os
LDFLAGS_64=	-arch x86_64

# Debugging flags
CFLAGS_DEBUG=	-g
CXXFLAGS_DEBUG=	-g
LDFLAGS_DEBUG=

# Default build flags
CFLAGS=		$(CFLAGS_FAT)
CXXFLAGS=	$(CXXFLAGS_FAT)
LDFLAGS=	$(LDFLAGS_FAT)

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

# Include prep, build, install in your Makefile

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

installpkg: pkg
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
	svn update
	svn copy . https://rudix.googlecode.com/svn/tags/pool/$(NAME)/$(NAME)-$(VERSION)-$(REVISION) -m "Tag: $(NAME) version $(VERSION) revision $(REVISION)"

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
