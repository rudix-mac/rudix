include ../../Library/GNU.mk

Title=		aria2
Name=		aria2
Version=	1.14.2
Revision=	0
URL=		http://downloads.sourceforge.net/aria2
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README.asciidoc
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-included-gettext

define final_inner_hook
/usr/local/bin/aria2c --version
/usr/local/bin/aria2c http://rudix.googlecode.com/hg/Ports/rudix/rudix.py
rm -f rudix.py
endef
