include ../../Library/GNU.mk

Title=		kconfig frontends
Name=		kconfig-frontends
Version=	4.11.0.1
Site=		https://gitlab.com/ymorin/kconfig-frontends
Source=		$(Site)/-/archive/master/kconfig-frontends-master.tar.gz
License=	GPL
Description=	Linux kernel configuration (aka kconfig) parser and frontends
UncompressedName= $(Name)-master
GnuConfigureExtra += --disable-nconf

BuildRequires += $(BinDir)/autoreconf
ReadMeFile=     $(SourceDir)/README
LicenseFile=    $(SourceDir)/COPYING

define after_prep_hook
autoreconf -fi $(BuildDir)/configure.ac
endef
