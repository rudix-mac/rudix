# free peer-reviewed portable C++ source libraries
# http://www.boost.org/
# MIT-like 

include ../../Library/Rules.mk

NAME=		boost
VERSION=	1.39.0
REVISION=	0intel
URL=		$(SOURCEFORGE)boost
SOURCE=		$(NAME)_1_39_0.tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	mv $(NAME)_1_39_0 $(NAME)-$(VERSION)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; ./bootstrap.sh ; ./bjam
	$(TOUCH) build

install: build
	install -d $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/tools/jam/src/bin.*/bjam $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDIR)/usr/local/lib
	#install -m 644 $(BUILDDIR)/stage/lib/lib*.dylib $(INSTALLDIR)/usr/local/lib
	cd $(BUILDDIR)/stage/lib ; (tar -cv lib*.dylib | tar -xv -C $(INSTALLDIR)/usr/local/lib)
	install -m 644 $(BUILDDIR)/stage/lib/lib*.a $(INSTALLDIR)/usr/local/lib
	cd $(BUILDDIR) ; find boost -type d -exec install -d $(INSTALLDIR)/usr/local/include/{} \;
	cd $(BUILDDIR) ; find boost ! -name \*.orig -type f -exec install -m 644 {} $(INSTALLDIR)/usr/local/include/{} \;
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{LICENSE_1_0.txt,README.txt} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
