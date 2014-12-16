include ../../Library/Python.mk

Title=		Bazaar
Name=		bzr
Version=	2.5.1
Revision=	1
Site=		http://bazaar-vcs.org/
URL=		http://launchpad.net/bzr/2.5/$(Version)/+download/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

LicenseFile=	$(SourceDir)/COPYING.txt

define test_inner_hook
$(BinDir)/bzr --version | grep $(Version)
endef
