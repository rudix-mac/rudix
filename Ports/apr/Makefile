include ../../Library/GNU.mk

Title=		Apache Portable Runtime
Name=		apr
Version=	1.7.0
Site=		http://apr.apache.org/
Source=		http://www.apache.org/dist/apr/$(Name)-$(Version).tar.bz2
License=	Apache License

LicenseFile=	$(BuildDir)/LICENSE

GnuConfigureExtra += --with-installbuilddir=/usr/local/share/apr-1/build-1
GnuConfigureExtra += --enable-threads

define after_install_hook
install -m 644 $(BuildDir)/docs/* $(InstallDir)/$(DocDir)/$(Name)
rm $(InstallDir)$(LibDir)/apr.exp
endef

define test_hook
$(BinDir)/apr-1-config --version
endef
