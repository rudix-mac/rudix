include ../../Library/Config.mk

RUDIX_ENABLE_NLS=

include ../../Library/Rudix.mk
include ../../Library/ConfigureFormula.mk

Title=		Nginx
Name=		nginx
Version=	1.0.6
Revision=	0
URL=		http://nginx.org/download/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFIle=	$(SourceDir)/LICENSE

ifdef FOO
install: build
	cd $(SourceDir) ; make DESTDIR=$(InstallDir) install
	rm -f $(InstallDir)$(Prefix)/nginx/conf/{fastcgi_params,mime.types,nginx.conf}
	for x in index.html 50x.html ; do \
		mv $(InstallDir)$(Prefix)/nginx/html/$$x \
		   $(InstallDir)$(Prefix)/nginx/html/$$x.default ; done
	strip $(InstallDir)$(Prefix)/nginx/sbin/*
	touch install

test: install
	for x in $(wildcard $(InstallDir)$(Prefix)/nginx/sbin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(SourceDir) ; make check
	touch test
endif
