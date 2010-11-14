# System to store and display time-series data
# http://oss.oetiker.ch/rrdtool/
# GPL

NAME=		rrdtool
VERSION=	1.4.1
REVISION=	0
URL=		http://oss.oetiker.ch/rrdtool/pub/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make)
	touch build

#
# Install in a self-contained directory root
#
install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	#cd $(BUILDDIR) ; make prefix=$(INSTALLDIR)/usr/local install
        #$(PYTHON) setup.py install \
                --home=$(INSTALLDIR)/usr/local \
                --install-lib=$(INSTALLDIR)/$(SITEPACKAGES)

	#rm -f $(INSTALLDIR)/usr/local/share/info/dir
	#rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	#rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias

	#install -d $(INSTALLDOCDIR)
	#install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)

	strip $(INSTALLDIR)/usr/local/bin/*
	#strip $(INSTALLDIR)/usr/local/sbin/*
	#strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	#strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	#strip -x -S $(INSTALLDIR)/$(SITEPACKAGES)/*/*.so
	touch install

test: install
	cd $(BUILDDIR) ; make check
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/sbin/*"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	#$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/*/*.so"
	touch test
