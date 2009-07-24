# $Id: Makefile,v 1.4 2009/05/04 01:28:35 ruda Exp $

# Motif toolkit
# http://www.motifzone.net/
# THE OPEN GROUP PUBLIC LICENSE

NAME=		openmotif
VERSION=	2.3.2
REVISION=	0
URL=		http://www.motifzone.net/files/public_downloads/openmotif/2.3/2.3.2/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

#ifdef WITHOUT_NLS
#NLS=		--disable-nls
#else
#DEPENDS+=	/usr/local/lib/libintl.dylib
#NLS=		--enable-nls
#endif

# Sometimes required to access FTP sites
#FETCH+=	--disable-epsv

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) --disable-dependency-tracking ; $(make)
	#env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) $(NLS) ; $(make)
	#cd $(BUILDDIR) ; $(make) CFLAGS="$(CFLAGS)"
	#cd $(BUILDDIR) ; $(PYTHON) setup.py build
	$(TOUCH) build

#
# Install in a self-contained directory root
#
install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	#cd $(BUILDDIR) ; make prefix=$(INSTALLDIR)/usr/local install
        #$(PYTHON) setup.py install \
		--no-compile \
                --home=$(INSTALLDIR)/usr/local \
                --install-lib=$(INSTALLDIR)/$(SITEPACKAGES)
	#$(PYTHON) -m compileall -d / $(INSTALLDIR)

	#rm -f $(INSTALLDIR)/usr/local/share/info/dir
	#rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	#rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias

	#install -d $(INSTALLDOCDIR)
	#install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)

	#strip $(INSTALLDIR)/usr/local/bin/*
	#strip $(INSTALLDIR)/usr/local/sbin/*
	#strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	#strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	#strip -x -S $(INSTALLDIR)/$(SITEPACKAGES)/*/*.so
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/sbin/*"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	#$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/*/*.so"
	$(TOUCH) test
