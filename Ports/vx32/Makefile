# Vx32: portable, efficient, safe execution of untrusted x86 code
# http://pdos.csail.mit.edu/~baford/vm/
# LGPL

include ../../Library/Rules.mk

TITLE=		Vx32 $(VERSION)
NAME=		vx32
VERSION=	0.12
REVISION=	2
URL=		http://pdos.csail.mit.edu/~baford/vm/release/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	patch -d $(BUILDDIR) -p1 < $(PORTDIR)/snowleopard.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR)/src ;  $(make) libvx32/libvx32.a 9vx/9vx vxrun/vxrun
	$(TOUCH) build

install: build
	install -d $(INSTALLDIR)/usr/local/lib
	install -m 644 $(BUILDDIR)/src/libvx32/libvx32.a $(INSTALLDIR)/usr/local/lib
	install -d $(INSTALLDIR)/usr/local/include/vx32
	install -m 644 $(BUILDDIR)/src/libvx32/*.h $(INSTALLDIR)/usr/local/include/vx32
	install -d $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/src/9vx/9vx $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/src/vxrun/vxrun $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/src/vxrun/vxrungcc $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/ADVENTURE $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/*.pdf $(INSTALLDOCDIR)
	install -m 644 $(PORTDIR)/LICENSE $(INSTALLDOCDIR)
	$(TOUCH) install
