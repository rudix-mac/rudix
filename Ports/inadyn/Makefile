# Simple DYNAMIC DNS client
# http://www.dyndns.com/support/clients/unix.html

NAME=		inadyn
VERSION=	1.96.2
REVISION=	9
URL=		http://cdn.dyndns.com
SOURCE=		$(NAME).zip

include ../../Library/Rules.mk

prep: retrieve
	unzip $(SOURCE)
	mv $(NAME) $(NAME)-$(VERSION)
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; $(make) CFLAGS="$(CFLAGS)" TARGET_ARCH=macosx
	$(TOUCH) build

install: build
	install -d $(INSTALLDIR)/usr/local/sbin
	install $(BUILDDIR)/bin/macosx/inadyn $(INSTALLDIR)/usr/local/sbin
	install -d $(INSTALLDIR)/usr/local/share/man/man{5,8}
	install -m 644 $(BUILDDIR)/man/inadyn.8 $(INSTALLDIR)/usr/local/share/man/man8
	install -m 644 $(BUILDDIR)/man/inadyn.conf.5 $(INSTALLDIR)/usr/local/share/man/man5
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/readme.html $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/sbin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/sbin/*"
	$(TOUCH) test
