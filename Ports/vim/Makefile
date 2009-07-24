# $Id: Makefile,v 1.2 2009/03/06 01:56:28 ruda Exp $

# Vi clone, many additional features
# http://www.vim.org/
# Carityware

NAME=		vim
VERSION=	7.2
REVISION=	2
URL=		http://ftp.vim.org/pub/vim/unix/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

ifdef WITHOUT_X11
X11=		--enable-gui=no --without-x
else
DEPENDS+=	/usr/X11R6
X11=		--enable-gui=yes --with-x
endif

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	mv vim72 $(NAME)-$(VERSION)
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) \
		--enable-multibyte --enable-cscope $(X11) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/README.txt $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	cd $(BUILDDIR)/src ; make check
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
