# $Id: Makefile,v 1.2 2009/03/21 22:06:38 ruda Exp $

HOMEPAGE=	http://www.python.org/doc/

NAME=		python-docs
VERSION=	2.5.1
REVISION=	1
URL=		http://www.python.org/ftp/python/doc/2.5.1/
SOURCE=		html-$(VERSION).tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	$(TOUCH) prep

build: prep
	$(TOUCH) build

install: retrieve
	install -d $(INSTALLDIR)/Developer/Documentation/Python
	tar jxvf $(PORTDIR)/$(SOURCE) -C $(INSTALLDIR)/Developer/Documentation/Python
	$(TOUCH) install

test: install
	$(TOUCH) test
