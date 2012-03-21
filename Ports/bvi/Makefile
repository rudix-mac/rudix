include ../../Library/GNU.mk

Title=		Bvi
Name=		bvi
Version=	1.3.2
Revision=	9
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)-$(Version).src.tar.gz

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/COPYING

define final_inner_hook
/usr/local/bin/bvi -c q
endef
