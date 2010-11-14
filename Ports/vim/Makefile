# Vi clone, many additional features
# http://www.vim.org/
# Carityware

include ../../Library/Rules.mk

NAME=		vim
VERSION=	7.3
REVISION=	0
URL=		http://ftp.vim.org/pub/vim/unix/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

ifdef WITHOUT_X11
CONFIG_OPTS=	--without-x
else
DEPENDS+=	/usr/X11R6
CONFIG_OPTS=	--with-x
endif

prep: retrieve
	tar jxvf $(SOURCE)
	mv vim73 $(NAME)-$(VERSION)
	touch prep

build: prep
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIG_OPTS) \
		--enable-multibyte --enable-cscope ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/README.txt $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR)/src ; make check
	touch test
