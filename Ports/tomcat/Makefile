# $Id: Makefile,v 1.2 2009/03/22 21:10:44 ruda Exp $

include ../../Library/Rules.mk

# Java servlet 2.5 and Java server pages 2.1 server
# http://tomcat.apache.org/

TITLE=		Apache Tomcat $(VERSION)
NAME=		apache-tomcat
VERSION=	6.0.20
REVISION=	0
URL=		http://archive.apache.org/dist/tomcat/tomcat-6/v$(VERSION)/bin/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	$(TOUCH) prep

build: prep $(DEPENDS)
	$(TOUCH) build

install: retrieve
	install -d $(INSTALLDIR)/usr/local/lib
	tar zxvf $(PORTDIR)/$(SOURCE) -C $(INSTALLDIR)/usr/local/lib
	mv $(INSTALLDIR)/usr/local/lib/$(NAME)-$(VERSION) \
		$(INSTALLDIR)/usr/local/lib/tomcat
	for x in  $(INSTALLDIR)/usr/local/lib/tomcat/conf/* ; do \
		mv $$x $$x.default ; \
	done
	install -d $(INSTALLDIR)/usr/local/sbin
	cd $(INSTALLDIR)/usr/local/sbin ; \
	ln -sf /usr/local/lib/tomcat/bin/startup.sh tomcat-startup.sh ; \
	ln -sf /usr/local/lib/tomcat/bin/shutdown.sh tomcat-shutdown.sh
	$(TOUCH) install

test: install
	$(TOUCH) test
