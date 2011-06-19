include ../../Library/Config.mk
RUDIX_UNIVERSAL=no
ArchFlags=
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	The GNU Multiple Precision Arithmetic Library
Site=		http://gmplib.org/
License=	GPL
Title=		GNU MP $(Version)
Name=		gmp
Version=	5.0.2
Revision=	0
URL=		ftp://ftp.gmplib.org/pub/gmp-$(Version)/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --enable-fat
GnuConfigureExtra += --enable-cxx

ifdef FOO
install: build
	cd $(SourceDir) ; make DESTDIR=$(InstallDir) install
	rm -f $(InstallDir)$(Prefix)/share/info/dir
	install -d $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(SourceDir)/{AUTHORS,ChangeLog,NEWS} $(InstallDir)/$(DocDir)/$(Name)
ifndef STATIC_ONLY
	strip -x $(InstallDir)$(LibDir)/*.dylib
endif
	strip -x $(InstallDir)$(LibDir)/*.a
	touch install
endif
