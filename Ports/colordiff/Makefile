include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/UnixFormula.mk

Title=		ColorDiff
Name=		colordiff
Version=	1.0.9
Revision=	2
URL=		http://colordiff.sourceforge.net/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/COPYING

define prep_post_hook
cd $(BuildDir) ; mv INSTALL _INSTALL
endef

define build_inner_hook
true
endef

define install_post_hook
mv $(InstallDir)/usr/local/etc/colordiffrc \
	$(InstallDir)/usr/local/etc/colordiffrc.default
endef
