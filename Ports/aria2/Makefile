include ../../Library/GNU.mk

Title=		aria2
Name=		aria2
Version=	1.15.1
Revision=	0
URL=		http://downloads.sourceforge.net/aria2
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-included-gettext

define final_inner_hook
$(BinDir)/aria2c --version
$(BinDir)/aria2c http://rudix.googlecode.com/hg/Ports/rudix/rudix.py
rm -f rudix.py
endef
