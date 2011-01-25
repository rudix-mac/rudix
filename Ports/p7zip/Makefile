# P7ZIP
# http://p7zip.sourceforge.net/
# LGPL

include ../../Library/Rules.mk

TITLE=		P7ZIP $(VERSION)
NAME=		p7zip
VERSION=	9.13
REVISION=	0.i386
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)_$(VERSION)_src_all.tar.bz2

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/DOCS/License.txt

prep: retrieve
	tar jxvf $(SOURCE)
	mv $(NAME)_$(VERSION) $(NAME)-$(VERSION)
	cd $(BUILDDIR) ; cp makefile.macosx_32bits makefile.machine
	touch prep

build: prep
	cd $(BUILDDIR) ; $(make) all3
	touch build

install: build
	install -d $(INSTALLDIR)
	cd $(BUILDDIR) ; \
	./install.sh /usr/local/bin \
		/usr/local/lib/p7zip \
		/usr/local/share/man \
		/usr/local/share/doc/p7zip $(INSTALLDIR)
	chmod u+w $(INSTALLDIR)/usr/local/lib/p7zip/7z*
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{README,TODO} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/p7zip/7z*
	chmod +w $(INSTALLDIR)/usr/local/lib/p7zip/Codecs/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/p7zip/Codecs/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/p7zip/7z*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/p7zip/Codecs/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
