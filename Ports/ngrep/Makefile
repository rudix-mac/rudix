include ../../Library/GNU.mk

Description=    ngrep provides a grep-like interface to the network layer
Title=		ngrep
Name=		ngrep
Version=	1_47
Site=		https://github.com/jpr5/ngrep
Source=		$(Site)/archive/V$(Version).tar.gz
License=	BSD like
ReadMeFile=     $(SourceDir)/README.md
LicenseFile=    $(SourceDir)/LICENSE

ConfigureExtra += --with-pcap-includes=/usr/include/pcap
LdFlags += -lresolv

PatchLevel = -p1

define prep_post_hook
rm -rf $(SourceDir)/autom4te.cache $(SourceDir)/{.deps,Makefile}
endef

define test_hook
$(SBinDir)/ngrep -V | grep V$(Version)
endef
