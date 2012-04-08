include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/UnixFormula.mk

Title=		SIMH
Name=		simh
Version=	3.8.1
Revision=	2
URL=		http://simh.trailing-edge.com/sources/
Source=		$(Name)v38-1.zip

ReadMeFile=	$(SourceDir)/0readme_38.txt
LicenseFile=	LICENSE.txt

EnvExtra += OSTYPE="darwin"
EnvExtra += USE_NETWORK=1

ifdef FOO
install: build
	install -d $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/BIN/* $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/*.txt $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/*/*.txt $(INSTALLDOCDIR)
	install -m 644 $(PORTDIR)/LICENSE.txt $(INSTALLDOCDIR)
	install -m 644 $(PORTDIR)/simh_faq.pdf $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
endif
