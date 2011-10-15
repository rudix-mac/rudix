include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		APR
Name=		apr
Version=	1.4.5
Revision=	0
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
