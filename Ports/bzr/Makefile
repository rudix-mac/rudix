include ../../Library/Python.mk

Title=		Bazaar
Name=		bzr
Version=	2.5.0
Revision=	0
URL=		http://launchpad.net/bzr/2.5/$(Version)/+download/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING.txt

define final_inner_hook
/usr/local/bin/bzr
endef
