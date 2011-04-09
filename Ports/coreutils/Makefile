include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	GNU core utilities
Site=		http://www.gnu.org/software/coreutils/
License=	GPL
Title=		GNU Core Utilities $(Version)
Name=		coreutils
Version=	8.9
Revision=	0
URL=		http://ftp.gnu.org/gnu/coreutils/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

#ifdef WITH_STATIC_NLS
#LDFLAGS+=	-framework CoreFoundation -liconv
#endif

GnuConfigureExtra += jm_cv_func_svid_putenv=yes
GnuConfigureExtra +=  --program-prefix=gnu


ifdef FOO
install: build
	cd $(SourceDir) ; make DESTDIR=$(InstallDir) install
	rm -f $(InstallDir)$(Prefix)/share/info/dir
	rm -f $(InstallDir)$(LibDir)/charset.alias
	rm -f $(InstallDir)$(Prefix)/share/locale/locale.alias
	$(PORTDIR)/mklinks.sh $(InstallDir)$(BinDir)
	$(PORTDIR)/mklinks.sh $(InstallDir)$(Prefix)/share/man/man1
	install -d $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(ReadMeFile) $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(LicenseFile) $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(SourceDir)/{AUTHORS,ChangeLog,NEWS,THANKS,TODO} $(InstallDir)/$(DocDir)/$(Name)
	strip $(InstallDir)$(BinDir)/*
	touch install
endif