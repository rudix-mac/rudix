# scheme r5 library
# http://people.csail.mit.edu/jaffer/SLIB
# BSD

NAME=		slib
VERSION=	3b1
REVISION=	0
URL=		http://groups.csail.mit.edu/mac/ftpdir/scm/
SOURCE=		$(NAME)-$(VERSION).zip

include ../../Library/Rules.mk

prep: retrieve
	unzip $(SOURCE)
	mv slib $(NAME)-$(VERSION)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; make
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; \
	make prefix=$(INSTALLDIR)/usr/local/ \
		man1dir=$(INSTALLDIR)/usr/local/share/man/man1/ \
		infodir=$(INSTALLDIR)/usr/local/share/info install
	perl -pi -e "s!$(INSTALLDIR)!!g" $(INSTALLDIR)/usr/local/bin/slib
	install -m 644 $(BUILDDIR)/{*.txt,*.xyz,*.ps} $(INSTALLDIR)/usr/local/lib/slib
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{ANNOUNCE,COPYING,README,FAQ} $(INSTALLDOCDIR)
	$(TOUCH) install

test: install
	$(TOUCH) test
