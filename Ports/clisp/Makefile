include ../../Library/Configure.mk

Title=		CLISP
Name=		clisp
Version=	2.49
Revision=	0
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/SUMMARY
LicenseFile=	$(SourceDir)/COPYRIGHT

#ifdef WITH_STATIC_NLS
#LDFLAGS+=	-framework CoreFoundation -liconv
#endif

#FIXME:
#DEPENDS=	$(LibDir)/libreadline.la
#DEPENDS+=	$(LibDir)/libintl.la
#DEPENDS+=	$(LibDir)/libsigsegv.la
#DEPENDS+=	$(LibDir)/libavcall.la


ifdef FOO
install: build
	cd $(SourceDir) ; make -C src DESTDIR=$(InstallDir) install
	rm -rf $(InstallDir)$(BinDir)/clisp.dSYM
	touch install

test: install
	cd $(SourceDir) ; make -C src check
	touch test
endif
