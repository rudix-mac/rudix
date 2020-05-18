include ../../Library/GNU.mk

Title=		C-Ares
Name=		c-ares
Version=	1.16.1
Site=		https://c-ares.haxx.se
Source=		https://c-ares.haxx.se/download/c-ares-$(Version).tar.gz
License=    MIT

ReadMeFile=	$(BuildDir)/README.md
LicenseFile= $(BuildDir)/LICENSE.md

define test_hook
$(BinDir)/c-ares --version | grep $(Version)
endef
