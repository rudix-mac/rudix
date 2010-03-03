# Interpreted object-oriented programming language
# http://www.python.org/
# Python License

NAME=		Python
VERSION=	3.1.1
REVISION=	0
URL=		http://www.python.org/ftp/python/$(VERSION)
SOURCE=		Python-$(VERSION).tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CC="/Developer/usr/bin/llvm-gcc" \
	$(configure) --enable-universalsdk --enable-framework ; $(make)
	$(TOUCH) build

install: build
	mkdir -p $(INSTALLDIR)
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{LICENSE,README,Grammar/Grammar} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/Library/Frameworks/Python.framework/Versions/3.1/bin/*
	strip -x -S $(INSTALLDIR)/Library/Frameworks/Python.framework/Versions/3.0/lib/python3.0/lib-dynload/*.so
	$(TOUCH) install

test: install
	#cd $(BUILDDIR) ; make test
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/python*"
	$(test-universal-binary) "$(INSTALLDIR)/Library/Frameworks/Python.framework/Versions/3.1/lib/python3.1/lib-dynload/*.so"
	$(TOUCH) test
