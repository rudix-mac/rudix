BuildRequires += $(BinDir)/cython # cython

include ../../Library/Python.mk

Title=		Bazaar
Name=		bzr
Version=	2.7.0
Site=		https://bazaar.canonical.com/
Source=		https://launchpad.net/bzr/2.7/$(Version)/+download/bzr-$(Version).tar.gz
License=	GPLv2

LicenseFile=	$(SourceDir)/COPYING.txt

define test_hook
$(BinDir)/bzr --version | grep $(Version)
endef
