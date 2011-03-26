# Text based document generation
# http://www.methods.co.nz/asciidoc/
# GPL

include ../../Library/Rules.mk
include ../../Library/GNUConfigure.mk

TITLE=		AsciiDoc $(VERSION)
NAME=		asciidoc
VERSION=	8.6.3
REVISION=	0
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

gcmakecheck= make test

define gcinstallextra
mv $(INSTALLDIR)$(PREFIX)/etc/asciidoc/asciidoc.conf \
   $(INSTALLDIR)$(PREFIX)/etc/asciidoc/asciidoc.conf.default
endef
