include ../../Library/GNU.mk

Title=		kconfig frontends
Name=		kconfig-frontends
Version=	4.11.0.1
Commit=		df6a283f24aa146ab862950503db9542a12dab7a
Site=		https://gitlab.com/ymorin/kconfig-frontends
Source=		https://gitlab.com/ymorin/kconfig-frontends/repository/${Commit}/archive.tar.gz
License=	GPL
Description=	Linux kernel configuration (aka kconfig) parser and frontends
UncompressedName=${Name}-${Commit}-${Commit}
GnuConfigureExtra += --disable-nconf

ReadMeFile=     $(SourceDir)/README
LicenseFile=    $(SourceDir)/COPYING


define after_prep_hook
autoreconf -fi $(BuildDir)/configure.ac
endef
