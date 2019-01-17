include ../../Library/UNIX.mk

Title=		LaTex to RTF
Name=		latex2rtf
Version=	2.3.17
Site=		https://sourceforge.net/projects/$(Name)
Source=		https://sourceforge.net/projects/$(Name)/files/$(Name)-unix/$(Version)/$(Name)-$(Version).tar.gz/download
License=	GPLv2
LicenseFile=	$(SourceDir)/Copyright

# GnuConfigureExtra += --with-readline=/usr/local
# LdFlags += -framework CoreFoundation -liconv

define after_prep_hook
patch -p0 -d $(SourceDir) < patches/01-Makefile.diff
endef

define test_hook
$(BinDir)/$(latex2rtf) -V | grep $(Version)
endef
