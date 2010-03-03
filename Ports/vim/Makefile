# Vi clone, many additional features
# http://www.vim.org/
# Carityware

include ../../Library/Rules.mk

NAME=		vim
VERSION=	7.2
REVISION=	3
URL=		http://ftp.vim.org/pub/vim/unix/
SOURCE=		$(NAME)-$(VERSION).tar.bz2
URL_EXTRA=	http://ftp.vim.org/pub/vim/extra/
SOURCE_EXTRA=	vim-7.2-extra.tar.gz

ifdef WITHOUT_X11
X11=		--enable-gui=carbon --without-x
else
DEPENDS+=	/usr/X11R6
X11=		--enable-gui=carbon --with-x
endif

prep: retrieve
	tar jxvf $(SOURCE)
	tar zxvf $(SOURCE_EXTRA)
	mv vim72 $(NAME)-$(VERSION)
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
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
