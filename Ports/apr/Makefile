include ../../Library/GNU.mk

Title=		Apache Portable Runtime
Name=		apr
Version=	1.7.0
Site=		https://apr.apache.org/
Source=		https://downloads.apache.org/apr/apr-$(Version).tar.bz2
License=	Apache License
LicenseFile=	$(SourceDir)/LICENSE

GnuConfigureExtra += --with-installbuilddir=/usr/local/share/apr-1/build-1
GnuConfigureExtra += --enable-threads

define after_install_hook
install -m 644 $(BuildDir)/docs/* $(DestDir)/$(DocDir)/$(Name)
rm $(InstallDir)$(LibDir)/apr.exp
endef

define test_hook
$(BinDir)/apr-1-config --version | grep $(Version)
endef
