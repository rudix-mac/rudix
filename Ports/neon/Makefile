# HTTP and WebDAV client library, with C interface
# http://www.webdav.org/neon/
# LGPL

include ../../Library/GNU.mk

Title=		Neon
Name=		neon
Version=	0.29.6
Revision=	0
URL=		http://www.webdav.org/neon/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	LICENSE

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
define prep_post_hook
perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif

GnuConfigureExtra += --enable-shared
