include ../../Library/Python.mk

Title=		SCons
Name=		scons
Version=	2.3.1
Site=		http://www.scons.org
Source=		http://downloads.sourceforge.net/scons/$(Name)-$(Version).tar.gz
License=	MIT

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/scons --version | grep $(Version)
endef
