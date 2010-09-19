# OfflineIMAP
# http://software.complete.org/offlineimap
# GPL

# Packager: Caio Begotti <http://caio.ueberalles.net>

include ../../Library/Rules.mk

TITLE=		Offline IMAP $(VERSION)
NAME=		offlineimap
VERSION=	6.2.0
REVISION=	0
URL=		http://software.complete.org/software/attachments/download/413
SOURCE=		$(NAME)_$(VERSION).orig.tar.gz

PYTHON=		/usr/bin/python2.6
SITEPACKAGES=	/Library/Python/2.6/site-packages

prep: retrieve
	tar zxvf $(SOURCE)
	# http://www.mail-archive.com/fink-users@lists.sourceforge.net/msg31539.html
	/usr/bin/sed -i -e 's/^from/import locale; from/' $(NAME)/bin/offlineimap
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(NAME) ; $(PYTHON) setup.py build
	$(TOUCH) build

install: build
	cd $(NAME) ; \
	$(PYTHON) setup.py install \
		--no-compile \
                --root=$(INSTALLDIR) \
		--prefix=/usr/local \
		--install-lib=$(SITEPACKAGES)
	$(PYTHON) -m compileall -d / $(INSTALLDIR)
	install -d $(INSTALLDOCDIR)
	install -m 644 $(NAME)/{UPGRADING,COPYING,COPYRIGHT,FAQ.html,offlineimap.conf*} $(INSTALLDOCDIR)
	$(TOUCH) install

test: install
	$(TOUCH) test
