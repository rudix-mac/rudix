include ../../Library/Unix.mk

Site=		https://github.com/rudix-mac/rpm/
Title=		Rudix Package Manager
Name=		rudix
Version=	2015.5
Revision=	0
Source=		https://github.com/rudix-mac/rpm/archive/$(Version).tar.gz
License=	BSD

UncompressedName=rpm-$(Version)

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

ifeq ($(OSXVersion),10.6)
define prep_post_hook
patch -p0 -d $(SourceDir) < py26.diff
endef
endif

define check_inner_hook
cd $(BuildDir) && make test
endef

define test_inner_hook
$(BinDir)/rudix --version | grep $(Version)
endef
