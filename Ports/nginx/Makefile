# Robust and small HTTP server and mail proxy server
# http://nginx.org/
# BSD?

include ../../Library/Rules.mk

TITLE=		nginx $(VERSION)
NAME=		nginx
VERSION=	0.7.64
REVISION=	0
URL=		http://nginx.org/download/
#URL=		http://downloads.sourceforge.net/template
#URL=		http://ftp.gnu.org/gnu/template
SOURCE=		$(NAME)-$(VERSION).tar.gz
#SOURCE=	$(NAME)-$(VERSION).tar.bz2
#SOURCE=	$(NAME)-$(VERSION).tar.Z
#SOURCE=	$(NAME)-$(VERSION).zip

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	./configure ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/nginx/conf/{fastcgi_params,mime.types,nginx.conf}
	for x in index.html 50x.html ; do \
		mv $(INSTALLDIR)/usr/local/nginx/html/$$x \
		   $(INSTALLDIR)/usr/local/nginx/html/$$x.default ; done
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/nginx/sbin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/nginx/sbin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	touch test
