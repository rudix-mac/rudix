include ../../Library/GNU.mk

Title=		APR
Name=		apr
Version=	1.4.6
Revision=	1
URL=		http://www.apache.org/dist/apr
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/LICENSE

GnuConfigureExtra += --with-installbuilddir=/usr/local/share/apr-1/build-1
GnuConfigureExtra += --enable-threads

define install_post_hook
install -m 644 $(BuildDir)/docs/* $(InstallDir)/$(DocDir)/$(Name)
rm $(InstallDir)$(LibDir)/apr.exp
endef

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif

define test_inner_hook
$(BinDir)/apr-1-config --version
endef
