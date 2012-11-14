include ../../Library/GNU.mk

Title=		Extended Module player
Name=		xmp
Version=	3.5.0
Revision=	0
URL=		http://sourceforge.net/projects/xmp/files/xmp/$(Version)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/docs/COPYING

define install_post_hook
rm -rf $(InstallDir)/etc
endef

define test_inner_hook
$(BinDir)/xmp --version
endef
