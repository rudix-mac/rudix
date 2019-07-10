include ../../Library/Configure.mk

BuildRequires += $(LibDir)/libsigsegv.la

Title=		CLISP
Name=		clisp
Version=	2.49
Site=		http://www.clisp.org/
Source=		http://downloads.sourceforge.net/$(Name)/$(Name)-$(Version).tar.gz
License=	GPL

ReadMeFile=	$(SourceDir)/SUMMARY
LicenseFile=	$(SourceDir)/COPYRIGHT

BuildDir=$(SourceDir)/src

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
