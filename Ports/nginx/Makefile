BuildRequires += $(BinDir)/pcre-config

include ../../Library/Config.mk
RUDIX_ENABLE_NLS=
include ../../Library/Rudix.mk
include ../../Library/ConfigureFormula.mk

Title=		Nginx
Name=		nginx
Version=	1.0.14
Revision=	0
URL=		http://nginx.org/download/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	README
LicenseFIle=	$(SourceDir)/LICENSE

define install_post_hook__
rm -f $(InstallDir)$(Prefix)/nginx/conf/{fastcgi_params,mime.types,nginx.conf}
for x in index.html 50x.html ; do \
	mv $(InstallDir)$(Prefix)/nginx/html/$$x \
	   $(InstallDir)$(Prefix)/nginx/html/$$x.default ; done
touch install

endef
ifdef FOO
install: build
	cd $(SourceDir) ; make DESTDIR=$(InstallDir) install
endif
